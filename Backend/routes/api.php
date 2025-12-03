<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\FacultyController;
use App\Http\Controllers\ProjectController;

// Handle unauthenticated access
Route::get('/login', function () {
    return response()->json(['message' => 'Unauthenticated.'], 401);
})->name('login');

// PUBLIC ROUTES
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

// STUDENT ROUTES
Route::middleware(['auth:sanctum', 'student'])->group(function () {
    Route::get('/student/dashboard', [StudentController::class, 'dashboard']);
    Route::get('/student/projects', [StudentController::class, 'listProjects']); // returns all uploaded documents
    Route::get('/student/project/{id}', [StudentController::class, 'viewProject']);
    Route::post('/student/project/submit', [StudentController::class, 'submitProject']);
});

Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/faculty/dashboard', [FacultyController::class, 'dashboard']);
    Route::get('/faculty/projects', [FacultyController::class, 'listProjects']);
    Route::get('/faculty/project/{id}', [FacultyController::class, 'viewProject']);
    Route::post('/faculty/upload', [FacultyController::class, 'uploadCapstone']);
    Route::get('/faculty/documents', [FacultyController::class, 'listDocuments']);
});

// Optional: generic project store
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/projects', [ProjectController::class, 'store']);
});
