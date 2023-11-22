<?php

namespace App\Http\Controllers\Api;

use App\Models\admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;



class Admin_controller extends Controller
{
    //
    public function index()
    {
        return "hellow it is Admin Api Bro";
    }
    public function Showall()
    {

        $admins = admin::all();

        if ($admins->count() > 0) {
            return response()->json([
                'status' => 200,
                'admins' => $admins
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
            'phone_number' => 'nullable', // Assuming phone_number is optional, use 'nullable'
            'Image_url' => 'nullable',
        ]);
        $hashedPassword = Hash::make($request->password);
        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages(),
            ], 422);
        } else {
            $existingAdmin = admin::where('Email', $request->Email)->first();

            if ($existingAdmin) {
                // Admin with the given email already exists
                return response()->json([
                    'status' => 409,
                    'message' => 'Admin already Exists',
                ], 409);
            } else {
                $Admin = admin::create([
                    'Name' => $request->Name,
                    'Email' => $request->Email,
                    'password' => $hashedPassword,
                    'phone_number' => $request->phone_number,
                    'Image_url' => $request->Image_url,
                ]);
                if ($Admin) {

                    return response()->json([
                        'status' => 200,
                        'message' => 'Admin has been created Successfully'
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
        $Admin = admin::find($id);
        if ($Admin) {
            return response()->json([
                'status' => 200,
                'admin' => $Admin
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => "No such admin is found"
            ], 404);
        }
    }

    public function Update($id, Request $request)
    {
        $Admin = admin::find($id);
        if ($Admin) {
            $validator = Validator::make($request->all(), [
                'Name' => 'required|string|max:45',
                'Email' => 'required|email|max:100',
                'password' => 'required|min:8', // Assuming you want a minimum of 8 characters for the password
                'phone_number' => 'nullable', // Assuming phone_number is optional, use 'nullable'
                'Image_url' => 'nullable',
            ]);
            $hashedPassword = Hash::make($request->password);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 422,
                    'errors' => $validator->messages(),
                ], 422);
            } else {
                $Admin->update([
                    'Name' => $request->Name,
                    'Email' => $request->Email,
                    'password' => $hashedPassword,
                    'phone_number' => $request->phone_number,
                    'Image_url' => $request->Image_url,
                ]);
                return response()->json([
                    'status' => 200,
                    'message' => 'Admin has been Updated Successfully'
                ], 200);
            }
        } else {
            return response()->json([
                'status' => 404,
                'message' =>  'No such Admin Found',
            ], 404);
        }
    }

    public function Delete($id)
    {
        $Admin = admin::find($id);

        if ($Admin) {
            $Admin->delete();
            return response()->json([
                'status' => 200,
                "message" => "It has been delated successfully"
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                "message" => "No such Admin found"
            ], 404);
        }
    }
    public function deleteAll()
    {
        $admins = Admin::all();

        if ($admins->isEmpty()) {
            return response()->json([
                'status' => 404,
                'message' => 'No records found',
            ], 404);
        }

        foreach ($admins as $admin) {
            $admin->delete();
        }
        // Reset auto-incremented ID for the table (MySQL example)
        DB::statement('ALTER TABLE admins AUTO_INCREMENT = 1');
        return response()->json([
            'status' => 200,
            'message' => 'All admins deleted successfully',
        ], 200);
    }
}
