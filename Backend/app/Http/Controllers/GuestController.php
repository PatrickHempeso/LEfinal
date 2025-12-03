<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Document;

class GuestController extends Controller
{
    /**
     * Show all documents for guest users
     */
    public function dashboard()
    {
        // Fetch all columns needed by React
        $documents = Document::select(
            'DocumentID',
            'Title',
            'Keywords',
            'Authors',
            'YearPublished',
            'Abstract'
        )->get();

        return response()->json([
            'status' => 'success',
            'data' => $documents
        ]);
    }

    /**
     * Show single document for guest
     */
    public function viewDocument($id)
    {
        $document = Document::select(
            'DocumentID',
            'Title',
            'Keywords',
            'Authors',
            'YearPublished',
            'Abstract'
        )->where('DocumentID', $id)->first();

        if (!$document) {
            return response()->json([
                'status' => 'error',
                'message' => 'Document not found'
            ], 404);
        }

        return response()->json([
            'status' => 'success',
            'data' => $document
        ]);
    }
}
