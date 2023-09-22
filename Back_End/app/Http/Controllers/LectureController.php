<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Lecture; // Import the Lecture model at the top of your controller

class LectureController extends Controller
{
    public function index()
    {
        // Retrieve and return a list of lectures
        $lectures = Lecture::all(); // Assuming you want to retrieve all lectures
        return response()->json($lectures, 200);
    }

    public function show($id)
    {
        // Retrieve and return a single lecture by its ID
        $lecture = Lecture::find($id);

        if (!$lecture) {
            return response()->json(['message' => 'Lecture not found'], 404);
        }

        return response()->json($lecture, 200);
    }

    public function store(Request $request)
    {
        // Validate and create a new lecture
        $request->validate([
            'subject' => 'required|string',
            'location' => 'required|string',
            'date_time' => 'required|date',
        ]);

        $lecture = new Lecture([
            'subject' => $request->input('subject'),
            'location' => $request->input('location'),
            'date_time' => $request->input('date_time'),
        ]);

        $lecture->save();

        return response()->json($lecture, 201);
    }

    public function update(Request $request, $id)
    {
        // Validate and update an existing lecture by its ID
        $request->validate([
            'subject' => 'required|string',
            'location' => 'required|string',
            'date_time' => 'required|date',
        ]);

        $lecture = Lecture::find($id);

        if (!$lecture) {
            return response()->json(['message' => 'Lecture not found'], 404);
        }

        $lecture->subject = $request->input('subject');
        $lecture->location = $request->input('location');
        $lecture->date_time = $request->input('date_time');
        $lecture->save();

        return response()->json($lecture, 200);
    }

    public function destroy($id)
    {
        // Delete a lecture by its ID
        $lecture = Lecture::find($id);

        if (!$lecture) {
            return response()->json(['message' => 'Lecture not found'], 404);
        }

        $lecture->delete();

        return response()->json(['message' => 'Lecture deleted'], 200);
    }
}
