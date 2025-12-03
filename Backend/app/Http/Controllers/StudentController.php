<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student;
use App\Models\StudentCapstone;
use App\Models\StudentThesis;
use App\Models\Document;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class StudentController extends Controller
{
    // ===== STUDENT DASHBOARD =====
    public function dashboard(Request $request)
    {
        $student = $request->user();

        if (!$student || !isset($student->StudentID)) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        $totalCapstones = StudentCapstone::where('StudentID', $student->StudentID)->count();
        $totalTheses = StudentThesis::where('StudentID', $student->StudentID)->count();

        return response()->json([
            'student' => [
                'id' => $student->StudentID,
                'firstName' => $student->FirstName,
                'lastName' => $student->LastName,
                'program' => $student->Program,
                'programType' => $student->ProgramType,
            ],
            'stats' => [
                'capstones' => $totalCapstones,
                'theses' => $totalTheses
            ]
        ]);
    }

    // ===== VIEW SINGLE PROJECT =====
    public function viewProject($id)
    {
        $project = StudentCapstone::find($id) ?? StudentThesis::find($id);

        if (!$project) {
            return response()->json(['message' => 'Project not found'], 404);
        }

        $type = $project instanceof StudentCapstone ? 'Capstone' : 'Thesis';
        $projectIDKey = $project instanceof StudentCapstone ? 'CapstoneID' : 'ThesisID';

        return response()->json([
            'id' => $project->$projectIDKey,
            'title' => $project->Title,
            'abstract' => $project->Abstract,
            'keywords' => $project->Keywords,
            'authors' => $project->Authors,
            'adviser' => $project->Adviser,
            'program' => $project->Program ?? '',
            'status' => $project->Status ?? '',
            'type' => $type,
        ]);
    }

    // ===== SUBMIT PROJECT =====
    public function submitProject(Request $request)
    {
        Log::info('SubmitProject called', ['request' => $request->all()]);

        $request->validate([
            'title' => 'required|string',
            'type' => 'required|in:Capstone,Thesis',
            'abstract' => 'required|string',
            'keywords' => 'required|string',
            'adviser' => 'nullable|string',
            'yearPublished' => 'required|integer',
            'students' => 'required|array|min:1',
            'students.*.firstName' => 'required|string',
            'students.*.lastName' => 'required|string',
            'students.*.email' => 'nullable|email',
            'students.*.program' => 'required|string',
            'students.*.programType' => 'required|string',
        ]);

        DB::beginTransaction();

        try {
            // ===== Generate DocumentID =====
            $lastDoc = Document::orderByRaw('CAST(SUBSTRING(DocumentID, 3) AS UNSIGNED) DESC')->first();
            $nextDocNum = $lastDoc ? intval(substr($lastDoc->DocumentID, 2)) + 1 : 1;
            $documentId = 'DC' . str_pad($nextDocNum, 3, '0', STR_PAD_LEFT);

            // ===== Insert Students =====
            $authorNames = [];
            $studentIds = [];

            foreach ($request->students as $s) {
                $lastStudent = Student::lockForUpdate()
                    ->orderByRaw('CAST(SUBSTRING(StudentID, 3) AS UNSIGNED) DESC')
                    ->first();
                $nextIdNum = $lastStudent ? intval(substr($lastStudent->StudentID, 2)) + 1 : 1;
                $studentId = 'ST' . str_pad($nextIdNum, 3, '0', STR_PAD_LEFT);

                Student::create([
                    'StudentID' => $studentId,
                    'FirstName' => $s['firstName'],
                    'LastName' => $s['lastName'],
                    'Email' => $s['email'] ?? null,
                    'Program' => $s['program'],
                    'ProgramType' => $s['programType'],
                ]);

                $authorNames[] = $s['firstName'] . ' ' . $s['lastName'];
                $studentIds[] = $studentId;
            }

            $authorsString = implode('; ', $authorNames);

            // ===== Insert Document =====
            Document::create([
                'DocumentID' => $documentId,
                'Title' => $request->title,
                'Keywords' => $request->keywords,
                'Authors' => $authorsString,
                'YearPublished' => $request->yearPublished,
                'Abstract' => $request->abstract,
            ]);

            // ===== Insert Capstone or Thesis =====
            if ($request->type === 'Capstone') {
                $lastCap = StudentCapstone::orderByRaw('CAST(SUBSTRING(CapstoneID, 3) AS UNSIGNED) DESC')->first();
                $nextCapNum = $lastCap ? intval(substr($lastCap->CapstoneID, 2)) + 1 : 1;
                $projectId = 'CP' . str_pad($nextCapNum, 3, '0', STR_PAD_LEFT);

                StudentCapstone::create([
                    'CapstoneID' => $projectId,
                    'StudentID' => $studentIds[0],
                    'Title' => $request->title,
                    'Authors' => $authorsString,
                    'Abstract' => $request->abstract,
                    'YearPublished' => $request->yearPublished,
                    'Keywords' => $request->keywords,
                    'Adviser' => $request->adviser,
                    'DocumentID' => $documentId,
                ]);

            } else {
                $lastThesis = StudentThesis::orderByRaw('CAST(SUBSTRING(ThesisID, 3) AS UNSIGNED) DESC')->first();
                $nextThNum = $lastThesis ? intval(substr($lastThesis->ThesisID, 2)) + 1 : 1;
                $projectId = 'TH' . str_pad($nextThNum, 3, '0', STR_PAD_LEFT);

                StudentThesis::create([
                    'ThesisID' => $projectId,
                    'StudentID' => $studentIds[0],
                    'Title' => $request->title,
                    'Authors' => $authorsString,
                    'Abstract' => $request->abstract,
                    'YearPublished' => $request->yearPublished,
                    'Keywords' => $request->keywords,
                    'Adviser' => $request->adviser,
                    'DocumentID' => $documentId,
                ]);
            }

            DB::commit();

            return response()->json([
                'success' => true,
                'documentId' => $documentId,
                'studentIds' => $studentIds,
            ]);

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error("SubmitProject failed", ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Submission failed due to server error.',
                'error_detail' => $e->getMessage()
            ], 500);
        }
    }

    // ===== LIST ALL PROJECTS FOR STUDENT VIEW (Guest-style) =====
    public function listProjects(Request $request)
    {
        $student = $request->user();

        if (!$student || !isset($student->StudentID)) {
            return response()->json(['message' => 'Unauthorized or missing StudentID'], 401);
        }

        // Fetch all documents with standardized keys
        $documents = Document::select(
            'DocumentID',
            'Title',
            'Keywords',
            'Authors',
            'YearPublished',
            'Abstract',
        )
        ->orderBy('YearPublished', 'desc')
        ->get();
        
        // Map to frontend-friendly keys matching JSX
        $mappedDocuments = $documents->map(function($d) {
            return [
                'DocumentID' => $d->DocumentID,
                'Title' => $d->Title,
                'Authors' => $d->Authors,
                'Keywords' => $d->Keywords,
                'YearPublished' => $d->YearPublished,
                'Abstract' => $d->Abstract,
                'Program' => $d->Program ?? '',
                'Type' => $d->Type ?? ''
            ];
        });

        return response()->json([
            'status' => 'success',
            'data' => $documents
        ]);
    }
}
