<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Validator;

use Illuminate\Http\Request;
use App\Models\Quiz;
use Illuminate\Support\Facades\Storage;

class QuizController extends Controller
{
    public function store(Request $request)
    {
        // Validate the incoming request data
        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'question' => 'required|string',
            'file' => 'file|mimes:pdf,doc,docx', // You can customize allowed file types
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 400);
        }

        // Handle file upload if a file is present
        $filePath = null;

        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $filePath = $file->store('uploads/quizzes'); // Store in 'storage/app/uploads/quizzes'
        }

        // Create a new quiz record in the database
        $quiz = new Quiz([
            'title' => $request->input('title'),
            'question' => $request->input('question'),
            'file_path' => $filePath,
        ]);

        $quiz->save();

        // Return a success response
        return response()->json(['message' => 'Quiz created successfully'], 201);
    }
}
