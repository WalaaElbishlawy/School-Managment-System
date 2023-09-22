<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\EnrollmentStudent;
class EnrollmentStudentController extends Controller
{
public function store(Request $request)
{
    $validatedData = $request->validate([
        'name' => 'required|string',
        'age' => 'required|integer',
        'phone' => 'required|string',
        'address' => 'required|string',
        'selected_class' => 'required|string',
        'selected_gender' => 'required|string',
        'birth_date' => 'required|date',
        // Add validation rules for other fields
    ]);

    // Create a new enrollment student record and store it in the database
    EnrollmentStudent::create($validatedData);

    // You can return a success response or perform any other actions as needed
    return response()->json(['message' => 'Enrollment submitted successfully'], 200);


}
}
