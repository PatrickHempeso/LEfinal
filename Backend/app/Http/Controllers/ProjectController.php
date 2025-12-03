<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Capstone;
use App\Models\Thesis;

class ProjectController extends Controller
{
    public function store(Request $request)
    {
        // Validate request
        $validator = Validator::make($request->all(), [
            'Title' => 'required|string|max:255',
            'Abstract' => 'required|string',
            'Keywords' => 'nullable|string',
            'Authors' => 'required|string|max:255',
            'Adviser' => 'nullable|string|max:255',
            'YearPublished' => 'required|integer',
            'Type' => 'required|string|in:Capstone,Thesis',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'errors' => $validator->errors()
            ], 422);
        }

        $data = $request->only([
            'Title', 'Abstract', 'Keywords', 'Authors', 'Adviser', 'YearPublished'
        ]);

        // Determine table based on Type
        if ($request->Type === 'Capstone') {
            $project = Capstone::create($data);
        } else {
            $project = Thesis::create($data);
        }

        return response()->json([
            'status' => 'success',
            'project' => $project
        ], 201);
    }
}
