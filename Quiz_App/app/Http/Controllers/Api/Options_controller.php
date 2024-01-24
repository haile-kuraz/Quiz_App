<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\options;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;

class Options_controller extends Controller
{
    public function index()
    {
        return "hellow it is  options Api Bro";
    }

    public function Showall()
    {

        $Options = options::all();

        if ($Options->count() > 0) {
            return response()->json([
                'status' => 200,
                'Options' => $Options
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
            'code' => 'required|string|max:1',
            'Option_value' => 'string|max:50',
            'Is_correct' => 'boolean',
            'Question_id' => [
                'required',
                Rule::exists('normal_questions', 'id'),
            ],
        ]);


        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages(),
            ], 422);
        } else {
            $existingOption = options::where('Option_value', $request->Option_value)
                ->where('Question_id', $request->Question_id)
                ->first();

            if ($existingOption) {
                // category  with the given name already exists
                return response()->json([
                    'status' => 409,
                    'message' => 'The Option already Exists',
                ], 409);
            } else {
                $Option = options::create([
                    'code' => $request->code,
                    'Option_value' =>  $request->Option_value,
                    'Is_correct' =>  $request->Is_correct,
                    'Question_id' =>  $request->Question_id,
                ]);
                if ($Option) {

                    return response()->json([
                        'status' => 200,
                        'message' => 'Option has been created Successfully'
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
        $Option = options::find($id);
        if ($Option) {
            return response()->json([
                'status' => 200,
                'Option' =>  $Option
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => "No such Option is found"
            ], 404);
        }
    }

    public function Update($id, Request $request)
    {
        $Option = options::find($id);
        if ($Option) {
            $validator = Validator::make($request->all(), [
                'code' => 'required|string|max:1',
                'Option_value' => 'string|max:50',
                'Is_correct' => 'boolean',
                'Question_id' => [
                    'required',
                    Rule::exists('normal_questions', 'id'),
                ],
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => 422,
                    'errors' => $validator->messages(),
                ], 422);
            } else {
                $Option->update([
                    'code' => $request->code,
                    'Option_value' =>  $request->Option_value,
                    'Is_correct' =>  $request->Is_correct,
                    'Question_id' =>  $request->Question_id,
                ]);
                return response()->json([
                    'status' => 200,
                    'message' => 'Option has been Updated Successfully'
                ], 200);
            }
        } else {
            return response()->json([
                'status' => 404,
                'message' =>  'No such Option Found',
            ], 404);
        }
    }

    public function Delete($id)
    {
        $Option = options::find($id);

        if ($Option) {
            $Option->delete();
            return response()->json([
                'status' => 200,
                "message" => "Option has been delated successfully"
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                "message" => "No such Option found"
            ], 404);
        }
    }
    public function deleteAll()
    {
        $Options = options::all();

        if ($Options->isEmpty()) {
            return response()->json([
                'status' => 404,
                'message' => 'No records found',
            ], 404);
        }

        foreach ($Options as $Option) {
            $Option->delete();
        }
        // Reset auto-incremented ID for the table (MySQL example)
        DB::statement('ALTER TABLE options AUTO_INCREMENT = 1');
        return response()->json([
            'status' => 200,
            'message' => 'All Options deleted successfully',
        ], 200);
    }
}
