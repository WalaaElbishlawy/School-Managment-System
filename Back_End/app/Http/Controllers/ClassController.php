<?php

namespace App\Http\Controllers;

use App\Models\classes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ClassController extends Controller
{
    // Create a new class
    public function create(Request $request)
    {
        // Validate the request data
        $validator = Validator::make($request->all(), [
            'class_name' => 'required|string',
            'educational_level' => 'required|string',
            'level' => 'required|string',
            'subjects' => 'nullable|array',
            'teachers' => 'nullable|array',
            'students' => 'nullable|array',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        // Create a new class instance
        $class = new classes();
        $class->class_name = $request->input('class_name');
        $class->educational_level = $request->input('educational_level');
        $class->level = $request->input('level');
        $class->subjects = json_encode($request->input('subjects')); // Convert to JSON
        $class->teachers = json_encode($request->input('teachers')); // Convert to JSON
        $class->students = json_encode($request->input('students')); // Convert to JSON
        $class->save();

        return response()->json(['message' => 'Class created successfully', 'data' => $class], 201);
    }

    // Get class details by ID
    public function getClassDetails($id)
    {
        // Find the class by ID
        $class = classes::find($id);

        if (!$class) {
            return response()->json(['message' => 'Class not found'], 404);
        }

        return response()->json(['data' => $class]);
    }
}
