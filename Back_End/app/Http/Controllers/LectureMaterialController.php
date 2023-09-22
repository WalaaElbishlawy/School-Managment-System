<?php
// app/Http/Controllers/LectureMaterialController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\LectureMaterial;
use Illuminate\Support\Facades\Storage;

class LectureMaterialController extends Controller
{
    public function upload(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'lecture_title' => 'required|string|max:255',
            'lecture_number' => 'required|string',
            'file' => 'required|file|mimes:pdf,doc,docx',
        ]);

        // Handle file upload
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $filePath = $file->store('uploads/lecture_materials');
        }

        // Create a new lecture material record in the database
        $lectureMaterial = new LectureMaterial();
        $lectureMaterial->lecture_title = $request->input('lecture_title');
        $lectureMaterial->lecture_number = $request->input('lecture_number');
        $lectureMaterial->file_path = $filePath ?? null;
        $lectureMaterial->save();

        return response()->json(['message' => 'Lecture material uploaded successfully']);
    }
}
