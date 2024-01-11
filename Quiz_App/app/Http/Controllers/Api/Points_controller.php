<?php

namespace App\Http\Controllers\Api;

use App\Models\points;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class Points_controller extends Controller
{
    public function index()
    {
        return "hellow it is  Point Api Bro";
    }
    public function Showall()
    {

        $Point = points::all();

        if ($Point->count() > 0) {
            return response()->json([
                'status' => 200,
                'Points' => $Point
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
            'student_id' => [
                'required',
                Rule::exists('students', 'id'),
            ],
            'category_id'  => [
                'required',
                Rule::exists('categories', 'id'),
            ],

            'point' => 'required|numeric',

        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages(),
            ], 422);
        } else {
            $existPoint = points::where('category_id', $request->category_id)->first();

            if ($existPoint) {
                // Score with the given Student Id already exists
                return response()->json([
                    'status' => 409,
                    'message' => 'The Point is  already Exists',
                ], 409);
            } else {
                // Create a new score
                $Point = points::create([
                    'student_id' => $request->student_id,
                    'category_id' => $request->category_id,
                    'point' => $request->point,
                ]);

                if ($Point) {
                    return response()->json([
                        'status' => 200,
                        'message' => 'point has been registerd Correctly'
                    ], 200);
                } else {
                    return response()->json([
                        'status' => 500,
                        'message' => 'Server Error'
                    ], 500);
                }
            }
        }
    }

    public function Showone($student_id)
    {
        $Point = points::where('student_id', $student_id)->select('student_id', 'category_id', 'point')->first();
        if ($Point) {
            return response()->json([
                'status' => 200,
                'Score' =>  $Point
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => "No such Point is found"
            ], 404);
        }
    }



    // This is for Updting the Point value in the Score table
    public function UpdatePoint($student_id, $category_id,  Request $request)
    {
        $Point = points::where('student_id', $student_id)->where('category_id', $category_id)->first();
        if ($Point) {
            $validator = Validator::make($request->all(), [
                'point' => 'required|numeric',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => 422,
                    'errors' => $validator->messages(),
                ], 422);
            } else {
                // Ensure the sum does not exceed 100
                $newPointValue = $Point->point + $request->point;
                $updatedPointValue = min($newPointValue, 100);

                $Point->update([
                    'point' => $updatedPointValue,
                ]);

                return response()->json([
                    'status' => 200,
                    'message' => 'point has been Updated Successfully'
                ], 200);
            }
        } else {
            return response()->json([
                'status' => 404,
                'message' =>  'No such  point Found',
            ], 404);
        }
    }



    public function Delete($student_id)
    {

        $Point = points::where('student_id', $student_id)->first();

        if ($Point) {
            $Point->delete();
            return response()->json([
                'status' => 200,
                "message" => "Point has been delated successfully"
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                "message" => "No such Point found"
            ], 404);
        }
    }
    public function deleteAll()
    {
        $Points = points::all();

        if ($Points->isEmpty()) {
            return response()->json([
                'status' => 404,
                'message' => 'No such records found',
            ], 404);
        }

        foreach ($Points as $Point) {
            $Point->delete();
        }
        // Reset auto-incremented ID for the table (MySQL example)
        DB::statement('ALTER TABLE points AUTO_INCREMENT = 1');
        return response()->json([
            'status' => 200,
            'message' => 'All Points has been deleted successfully',
        ], 200);
    }
}
