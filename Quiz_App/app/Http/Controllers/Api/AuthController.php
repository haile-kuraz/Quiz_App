<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    //

    public function signin(Request $request)
    {
        $loginData = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if (!Auth::guard('student')->attempt($loginData)) { // Use the 'web' guard
            return response()->json(['message' => 'Invalid email or password'], 401);
        }

        $student = Auth::guard('student')->user(); // Use the 'web' guard
        // $token = $student->createToken('authToken')->accessToken;

        return response(['student' => $student]);
        // Invalid credentials

    }
}
