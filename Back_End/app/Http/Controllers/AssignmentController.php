<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Assignment;
use Illuminate\Support\Facades\Storage;

class AssignmentController extends Controller
{
    public function store(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'file' => 'required|file|mimes:pdf,doc,docx', // You can customize allowed file types
        ]);

        // Handle file upload
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $filePath = $file->store('uploads/assignments'); // Store in 'storage/app/uploads/assignments'
        }

        // Create a new assignment record in the database
        $assignment = new Assignment();
        $assignment->title = $request->input('title');
        $assignment->description = $request->input('description');
        $assignment->file_path = $filePath ?? null; // Store the file path if a file was uploaded
        $assignment->save();

        // Return a success response
        return response()->json(['message' => 'Assignment created successfully']);
    }
}
