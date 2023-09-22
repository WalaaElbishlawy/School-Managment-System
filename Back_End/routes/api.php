<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\ClassController;
use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\LectureController;
use App\Http\Controllers\AssignmentController;
use App\Http\Controllers\QuizController;
use App\Http\Controllers\LectureMaterialController;
use App\Http\Controllers\TeacherAccountController;
use App\Http\Controllers\EnrollmentStudentController;
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::middleware(['cors'])->group(function () {
    Route::post('/enrollment', [EnrollmentStudentController::class, 'store']);
    Route::post('upload-lecture-material', [LectureMaterialController::class,'upload']);
    Route::post('/assignments', [AssignmentController::class,'store']);
    Route::post('/quizzes', [QuizController::class,'store']);
    Route::post('classes', [ClassController::class,'create']);
    //Route::get('/admin', AdminController::class,'welcome');
    Route::post('events', [EventController::class, 'store']);
    Route::post('/auth/register', [AuthController::class,'register']);
    Route::post('/auth/login', [AuthController::class,'login']);
    Route::post('employees', [EmployeeController::class,'store']);
    Route::post('record-attendance', [AttendanceController::class,'recordAttendance']);
    Route::get('/lectures', [LectureController::class,'index']);
    Route::get('/lectures/{id}', [LectureController::class,'show']);
    Route::post('/lectures', [LectureController::class,'store']);
    Route::put('/lectures/{id}', [LectureController::class,'update']);
    Route::delete('/lectures/{id}', [LectureController::class,'destroy']);
    Route::prefix('api')->group(function () {
        Route::get('teacher-account-data', [TeacherAccountController::class, 'getData']);
    });
});


