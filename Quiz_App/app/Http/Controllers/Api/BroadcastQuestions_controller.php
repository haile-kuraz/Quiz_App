<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\broadcast_questions;
use App\Models\broadcast_options;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;

class BroadcastQuestions_controller extends Controller
{
    public function index()
    {
        return "hellow it is  BroadCastquestion Api Bro";
    }
    public function Showall()
    {

        $BroadCastQuestions = broadcast_questions::all();

        if ($BroadCastQuestions->count() > 0) {
            return response()->json([
                'status' => 200,
                'BroadCastQuestions' => $BroadCastQuestions
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'There is no data recorded'
            ], 404);
        }
    }
    public function getAllQuestionsWithTheirOptions()
    {
        $questions = broadcast_questions::with('broadcast_options')->get(); // Assuming the model name is Option

        if ($questions->count() > 0) {
            return response()->json([
                'status' => 200,
                'data' => $questions,
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'There is no data recorded',
            ], 404);
        }
    }


    public function Addnew(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'Question' => 'required|string|max:45',
            'description' => 'required|string|max:100',
            'dateofLive' => 'required',
            'start_time' => 'required',
            'end_time' => 'required',
        ]);


        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages(),
            ], 422);
        } else {
            $existingQuestion = broadcast_questions::where('question', $request->question)->first();

            if ($existingQuestion) {
                // category  with the given name already exists
                return response()->json([
                    'status' => 409,
                    'message' => 'The Question already Exists',
                ], 409);
            } else {
                $BroadCastquestion = broadcast_questions::create([
                    'Question' => $request->Question,
                    'description' =>  $request->description,
                    'dateofLive' =>  $request->dateofLive,
                    'start_time' =>  $request->start_time,
                    'end_time' => $request->end_time,
                ]);
                if ($BroadCastquestion) {

                    return response()->json([
                        'status' => 200,
                        'message' => 'BroadCastQuestions has been created Successfully'
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
        $BroadCastquestion = broadcast_questions::find($id);
        if ($BroadCastquestion) {
            return response()->json([
                'status' => 200,
                'question' =>  $BroadCastquestion
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => "No such BroadCastquestion is found"
            ], 404);
        }
    }

    public function Update($id, Request $request)
    {
        $BroadCastquestion = broadcast_questions::find($id);
        if ($BroadCastquestion) {
            $validator = Validator::make($request->all(), [
                'Question' => 'required|string|max:45',
                'description' => 'required|string|max:100',
                'dateofLive' => 'required',
                'start_time' => 'required',
                'end_time' => 'required',
            ]);


            if ($validator->fails()) {
                return response()->json([
                    'status' => 422,
                    'errors' => $validator->messages(),
                ], 422);
            } else {
                $BroadCastquestion->update([
                    'Question' => $request->Question,
                    'description' =>  $request->description,
                    'dateofLive' =>  $request->dateofLive,
                    'start_time' =>  $request->start_time,
                    'end_time' => $request->end_time,
                ]);
                return response()->json([
                    'status' => 200,
                    'message' => 'BroadCastquestion has been Updated Successfully'
                ], 200);
            }
        } else {
            return response()->json([
                'status' => 404,
                'message' =>  'No such BroadCastquestion Found',
            ], 404);
        }
    }

    public function Delete($id)
    {
        $BroadCastquestion = broadcast_questions::find($id);

        if ($BroadCastquestion) {
            $BroadCastquestion->delete();
            return response()->json([
                'status' => 200,
                "message" => "BroadCastquestion has been delated successfully"
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                "message" => "No such BroadCastquestion found"
            ], 404);
        }
    }
    public function deleteAll()
    {
        $BroadCastquestions = broadcast_questions::all();

        if ($BroadCastquestions->isEmpty()) {
            return response()->json([
                'status' => 404,
                'message' => 'No records found',
            ], 404);
        }

        foreach ($BroadCastquestions as $BroadCastquestion) {
            $BroadCastquestion->delete();
        }
        // Reset auto-incremented ID for the table (MySQL example)
        DB::statement('ALTER TABLE broadcast_questions AUTO_INCREMENT = 1');
        return response()->json([
            'status' => 200,
            'message' => 'All BroadCastquestions deleted successfully',
        ], 200);
    }
}
