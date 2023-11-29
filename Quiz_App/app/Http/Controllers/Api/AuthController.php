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
        $credentials = $request->only('email', 'password');

        if (Auth::guard('student')->attempt($credentials)) {
            $student = Auth::guard('student')->user();
            // Student authentication successful
            return response()->json(['message' => 'Sign-in successful', 'student' => $student]);
        }

        // Invalid credentials
        return response()->json(['message' => 'Invalid email or password'], 401);
    }
}
