<?php

namespace App\Http\Controllers;
use App\Models\Employee;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class EmployeeController extends Controller
{
    public function store(Request $request)
    {
        // Validating the request data
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'age' => 'required|integer',
            'national_id' => 'required|string',
            'gender' => 'required|string',
            'salary' => 'required|numeric',
            'major' => 'required|string',
            'phone' => 'required|string',
            'address' => 'required|string',
            'technical' => 'required|string',
            'birth_date' => 'required|date',
        ]);

        // Check if validation fails and return errors if any
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        // Create a new Employee instance and store it in the database
        $employee = Employee::create([
            'name' => $request->input('name'),
            'age' => $request->input('age'),
            'national_id' => $request->input('national_id'),
            'gender' => $request->input('gender'),
            'salary' => $request->input('salary'),
            'major' => $request->input('major'),
            'phone' => $request->input('phone'),
            'address' => $request->input('address'),
            'technical' => $request->input('technical'),
            'birth_date' => $request->input('birth_date'),
        ]);

        // Return a JSON response with the created employee data and 201 status code
        return response()->json($employee, 201);
    }
}
