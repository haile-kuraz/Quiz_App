<?php

namespace App\Http\Controllers\Api;

use App\Models\admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

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
}
