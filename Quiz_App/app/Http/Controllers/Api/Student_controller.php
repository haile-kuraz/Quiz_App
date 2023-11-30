<?php

namespace App\Http\Controllers\Api;

use App\Models\student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class Student_controller extends Controller
{
    //
    public function index()
    {
        return "hellow it is Student Api Bro";
    }
    public function Showall()
    {

        $admins = student::all();

        if ($admins->count() > 0) {
            return response()->json([
                'status' => 200,
                'students' => $admins
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'There is no data recorded'
            ], 404);
        }
    }


    public function Addnew(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'Name' => 'required|string|max:45',
            'Email' => 'required|email|max:100',
            'password' => 'required|min:8', // Assuming you want a minimum of 8 characters for the password
            'phone_number' => 'required|numeric|digits:10', // Assuming phone_number is optional, use 'nullable'
            'Image_url' => 'nullable',
        ]);
        $hashedPassword = Hash::make($request->password);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages(),
            ], 422);
        } else {
            $existingStudent = student::where('Email', $request->Email)->first();

            if ($existingStudent) {
                // Admin with the given email already exists
                return response()->json([
                    'status' => 409,
                    'message' => 'Student already Exists',
                ], 409);
            } else {
                $Student = student::create([
                    'Name' => $request->Name,
                    'Email' => $request->Email,
                    'password' => $hashedPassword,
                    'phone_number' => $request->phone_number,
                    'Image_url' => $request->Image_url,
                ]);
                if ($Student) {

                    return response()->json([
                        'status' => 200,
                        'message' => 'Student has been created Successfully'
                    ], 200);
                } else {
                    return response()->json([
                        'status' => 500,
                        'message' => 'Server Error '
                    ], 500);
                }
            }
        }
    }


    public function Showone($id)
    {
        $Student = student::find($id);
        if ($Student) {
            return response()->json([
                'status' => 200,
                'student' => $Student
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => "No such Student is found"
            ], 404);
        }
    }

    public function Update($id, Request $request)
    {
        $Student = student::find($id);
        if ($Student) {
            $validator = Validator::make($request->all(), [
                'Name' => 'required|string|max:45',
                'Email' => 'required|email|max:100',
                'password' => 'required|min:8', // Assuming you want a minimum of 8 characters for the password
                'phone_number' => 'required|numeric|digits:10',
                'Image_url' => 'nullable',
            ]);
            $hashedPassword = Hash::make($request->password);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 422,
                    'errors' => $validator->messages(),
                ], 422);
            } else {
                $Student->update([
                    'Name' => $request->Name,
                    'Email' => $request->Email,
                    'password' =>  $hashedPassword,
                    'phone_number' => $request->phone_number,
                    'Image_url' => $request->Image_url,
                ]);
                return response()->json([
                    'status' => 200,
                    'message' => 'Student has been Updated Successfully'
                ], 200);
            }
        } else {
            return response()->json([
                'status' => 404,
                'message' =>  'No such Student Found',
            ], 404);
        }
    }

    public function Delete($id)
    {
        $Student = student::find($id);

        if ($Student) {
            $Student->delete();
            return response()->json([
                'status' => 200,
                "message" => "Student has been delated successfully"
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                "message" => "No such Student found"
            ], 404);
        }
    }
    public function deleteAll()
    {
        $Student = student::all();

        if ($Student->isEmpty()) {
            return response()->json([
                'status' => 404,
                'message' => 'No Students found',
            ], 404);
        }

        foreach ($Student as $student) {
            $student->delete();
        }
        // Reset auto-incremented ID for the table (MySQL example)
        DB::statement('ALTER TABLE students AUTO_INCREMENT = 1');
        return response()->json([
            'status' => 200,
            'message' => 'All Students deleted successfully',
        ], 200);
    }

    public function login(Request $request)
    {
        $loginData = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
        $student = student::where('Email', $loginData['email'])->first();
        if (!$student || !Hash::check($loginData['password'], $student->password)) {
            return response([
                "status" => 401,
                "message" => "incorrect username or password"

            ], 401);
        } else {
            $token = $student->createToken('apiToken')->plainTextToken;
            return response(["status" => 201, "student" => $student, "token" => $token, "message" => "you have Loged"], 201);
        }
    }
}
