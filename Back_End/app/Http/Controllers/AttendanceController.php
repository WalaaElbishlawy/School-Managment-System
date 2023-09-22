<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AttendanceController extends Controller
{
    public function recordAttendance(Request $request)
    {
        try {
            // Validate the incoming data
            $validatedData = $request->validate([
                'class_id' => 'required|exists:classes,id',
                'student_ids' => 'required|array',
                'student_ids.*' => 'exists:students,id',
            ]);

            // Debug: Display the validated request data
            // dd($validatedData);
            // Record attendance for each student in the database
            foreach ($validatedData['student_ids'] as $studentId) {
                Attendance::create([
                    'class_id' => $validatedData['class_id'],
                    'student_id' => $studentId,
                    'is_present' => true, // You can adjust this based on your app's logic
                ]);
            }

            // Return a success response
            return response()->json(['message' => 'Attendance recorded successfully']);
        } catch (\Exception $e) {
            // Log or report the exception
            \Log::error($e);

            // Return an error response
            return response()->json(['error' => 'An error occurred'], 500);
        }
    }
}
