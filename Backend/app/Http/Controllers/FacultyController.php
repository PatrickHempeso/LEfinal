<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Faculty;
use App\Models\Capstone;
use App\Models\Document;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

class FacultyController extends Controller
{
    // Faculty Dashboard
    public function dashboard(Request $request)
    {
        $faculty = $request->user(); // no explicit 'faculty' guard
        if (!$faculty) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $totalCapstones = Capstone::where('FacultyID', $faculty->FacultyID)->count();

        return response()->json([
            'faculty' => [
                'id' => $faculty->FacultyID,
                'firstName' => $faculty->FirstName,
                'lastName' => $faculty->LastName,
                'role' => $faculty->Role,
            ],
            'stats' => [
                'capstones' => $totalCapstones
            ]
        ]);

    }

    // List Faculty Projects
    public function listProjects(Request $request)
    {
        $faculty = $request->user('faculty'); // explicit guard
        
        if (!$faculty || !isset($faculty->FacultyID)) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        $capstones = Capstone::where('FacultyID', $faculty->FacultyID)->get();

        $mappedCapstones = $capstones->map(function ($c) {
            return [
                'id' => (string) $c->CapstoneID,
                'title' => $c->Title ?? 'No Title',
                'abstract' => $c->Abstract ?? '',
                'keywords' => $c->Keywords ?? '',
                'authors' => $c->Authors ?? 'Unknown',
                'adviser' => $c->Adviser ?? '',
                'yearPublished' => $c->YearPublished ?? '',
                'dateCreated' => $c->DateCreated ?? '',
            ];
        });

        return response()->json([
            'status' => 'success',
            'data' => $mappedCapstones
        ]);
    }

    // View Single Faculty Project
    public function viewProject($id)
    {
        $project = Capstone::find($id);

        if (!$project) {
            return response()->json(['message' => 'Project not found'], 404);
        }

        return response()->json([
            'id' => $project->CapstoneID,
            'title' => $project->Title ?? 'No Title',
            'abstract' => $project->Abstract ?? '',
            'keywords' => $project->Keywords ?? '',
            'authors' => $project->Authors ?? 'Unknown',
            'adviser' => $project->Adviser ?? '',
            'yearPublished' => $project->YearPublished ?? '',
            'dateCreated' => $project->DateCreated ?? '',
        ]);
    }

    // Faculty Upload Capstone
    public function uploadCapstone(Request $request)
    {
        $faculty = $request->user('faculty'); // explicit guard

        if (!$faculty || !isset($faculty->FacultyID)) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        $request->validate([
            'title' => 'required|string|max:255',
            'abstract' => 'required|string',
            'keywords' => 'nullable|string',
            'author' => 'required|string',
            'file_path' => 'required|string'
        ]);

        $capstone = Capstone::create([
            'FacultyID' => $faculty->FacultyID,
            'Title' => $request->title,
            'Abstract' => $request->abstract,
            'Keywords' => $request->keywords,
            'Authors' => $request->author,
            'FilePath' => $request->file_path,
            'YearPublished' => now()->year
        ]);

        return response()->json([
            'status' => 'success',
            'message' => 'Capstone uploaded successfully',
            'capstone' => $capstone
        ]);
    }

    // List all documents (student-style, robust)
    public function listDocuments(Request $request)
{
    $faculty = $request->user('faculty'); // explicit guard
    if (!$faculty) {
        return response()->json(['error' => 'Unauthorized'], 401);
    }

    $documents = Document::orderBy('YearPublished', 'desc')->get();

    $mappedDocuments = $documents->map(function($d) {
        return [
            'DocumentID' => $d->DocumentID,
            'Title' => $d->Title ?? 'No Title',
            'Authors' => $d->Authors ?? 'Unknown',
            'Keywords' => $d->Keywords ?? '',
            'YearPublished' => $d->YearPublished ?? '',
            'Abstract' => $d->Abstract ?? '',
            'Program' => $d->Program ?? '',
            'Type' => $d->Type ?? ''
        ];
    });

    return response()->json([
        'status' => 'success',
        'data' => $mappedDocuments
    ]);
}

}
