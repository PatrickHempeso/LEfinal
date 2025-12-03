<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Faculty;
use App\Models\Student;
use Illuminate\Support\Facades\Log;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'login' => 'required|string',
            'password' => 'required|string'
        ]);

        $login = $request->login;
        $password = $request->password;

        // ===========================
        // 1. GUEST LOGIN
        // ===========================
        if ($login === 'guest') {
            return response()->json([
                'type' => 'guest',
                'token' => null,
            ]);
        }

        // ===========================
        // 2. FACULTY LOGIN
        // ===========================
        $faculty = Faculty::where('LoginDetails', $login)->first();

        if ($faculty) {
            if ($faculty->Password === null || $password !== $faculty->Password) {
                return response()->json(['error' => 'Incorrect password'], 401);
            }

            try {
                $token = $faculty->createToken('faculty_token', [], now()->addDays(1))->plainTextToken;
            } catch (\Exception $e) {
                Log::error('Faculty token creation failed', ['error' => $e->getMessage()]);
                return response()->json(['error' => 'Server error generating token'], 500);
            }

            return response()->json([
                'type' => 'faculty',
                'user' => [
                    'id' => $faculty->FacultyID,
                    'firstName' => $faculty->FirstName,
                    'lastName' => $faculty->LastName,
                    'role' => $faculty->Role,
                ],
                'token' => $token
            ]);
        }

        // ===========================
        // 3. STUDENT LOGIN
        // ===========================
        $student = Student::where('Email', $login)
                      ->orWhere('StudentID', $login)
                      ->first();

        if ($student) {
            if ($student->LoginDetails === null || $password !== $student->LoginDetails) {
                return response()->json(['error' => 'Incorrect password'], 401);
            }

            try {
                $token = $student->createToken('student_token')->plainTextToken;
            } catch (\Exception $e) {
                Log::error('Student token creation failed', [
                    'error' => $e->getMessage(),
                    'trace' => $e->getTraceAsString(),
                    'student' => $student
                ]);
                return response()->json(['error' => 'Server error generating token'], 500);
            }

            return response()->json([
                'type' => 'student',
                'user' => [
                    'id' => $student->StudentID,
                    'firstName' => $student->FirstName,
                    'lastName' => $student->LastName,
                    'program' => $student->Program,
                    'programType' => $student->ProgramType,
                ],
                'token' => $token
            ]);
        }


        // ===========================
        // 4. INVALID LOGIN
        // ===========================
        return response()->json(['error' => 'Invalid credentials'], 401);
    }
}
