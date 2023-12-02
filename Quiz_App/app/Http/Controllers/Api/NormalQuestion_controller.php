<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\normal_question;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;

class NormalQuestion_controller extends Controller
{

    public function index()
    {
        return "hellow it is  normal_question Api Bro";
    }
    public function Showall()
    {

        $Normalquestion = normal_question::all();

        if ($Normalquestion->count() > 0) {
            return response()->json([
                'status' => 200,
                'Questions' => $Normalquestion
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
            'question' => 'required|string|max:45',
            'solution_description' => 'required|string|max:100',
            'difficulty' => [
                'required',
                Rule::in(['easy', 'medium', 'hard']),
            ],
            'category_id' => [
                'required',
                Rule::exists('categories', 'id'),
            ],
            'subcategory_id' => [
                'required',
                Rule::exists('sub_categories', 'id'),
            ],

        ]);


        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages(),
            ], 422);
        } else {
            $existingQuestion = normal_question::where('question', $request->question)->first();

            if ($existingQuestion) {
                // category  with the given name already exists
                return response()->json([
                    'status' => 409,
                    'message' => 'The Question already Exists',
                ], 409);
            } else {
                $Normalquestion = normal_question::create([
                    'question' => $request->question,
                    'solution_description' => $request->solution_description,
                    'difficulty' => $request->difficulty,
                    'category_id' => $request->category_id,
                    'subcategory_id' => $request->subcategory_id,
                ]);
                if ($Normalquestion) {

                    return response()->json([
                        'status' => 200,
                        'message' => 'Normalquestion has been created Successfully'
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
        $Normalquestion = normal_question::find($id);
        if ($Normalquestion) {
            return response()->json([
                'status' => 200,
                'question' =>  $Normalquestion
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => "No such Normalquestion is found"
            ], 404);
        }
    }

    public function Update($id, Request $request)
    {
        $Normalquestion = normal_question::find($id);
        if ($Normalquestion) {
            $validator = Validator::make($request->all(), [
                'question' => 'required|string|max:45',
                'solution_description' => 'required|string|max:100',
                'difficulty' => [
                    'required',
                    Rule::in(['easy', 'medium', 'hard']),
                ],
                'category_id' => [
                    'required',
                    Rule::exists('categories', 'id'),
                ],
                'subcategory_id' => [
                    'required',
                    Rule::exists('sub_categories', 'id'),
                ],

            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => 422,
                    'errors' => $validator->messages(),
                ], 422);
            } else {
                $Normalquestion->update([
                    'question' => $request->question,
                    'solution_description' => $request->solution_description,
                    'difficulty' => $request->difficulty,
                    'category_id' => $request->category_id,
                    'subcategory_id' => $request->subcategory_id,
                ]);
                return response()->json([
                    'status' => 200,
                    'message' => 'Normalquestion has been Updated Successfully'
                ], 200);
            }
        } else {
            return response()->json([
                'status' => 404,
                'message' =>  'No such Normalquestion Found',
            ], 404);
        }
    }

    public function Delete($id)
    {
        $Normalquestion = normal_question::find($id);

        if ($Normalquestion) {
            $Normalquestion->delete();
            return response()->json([
                'status' => 200,
                "message" => "Normalquestion has been delated successfully"
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                "message" => "No such Normalquestion found"
            ], 404);
        }
    }
    public function deleteAll()
    {
        $Normalquestions = normal_question::all();

        if ($Normalquestions->isEmpty()) {
            return response()->json([
                'status' => 404,
                'message' => 'No records found',
            ], 404);
        }

        foreach ($Normalquestions as $Normalquestion) {
            $Normalquestion->delete();
        }
        // Reset auto-incremented ID for the table (MySQL example)
        DB::statement('ALTER TABLE normal_questions AUTO_INCREMENT = 1');
        return response()->json([
            'status' => 200,
            'message' => 'All Normalquestions deleted successfully',
        ], 200);
    }
}
