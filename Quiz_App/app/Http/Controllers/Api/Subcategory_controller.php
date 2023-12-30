<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\subcategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;



class Subcategory_controller extends Controller
{
    public function index()
    {
        return "hellow it is sub subcategory Api Bro";
    }
    public function Showall()
    {
        $Subcategories = subcategory::with(['normal_questions' => function ($query) {
            $query->select('id', 'category_id', 'subcategory_id');
        }])

            ->get(['id', 'category_id', 'name', 'Image_url', 'updated_at']);
        // $Subcategories = subcategory::all();

        if ($Subcategories->count() > 0) {
            return response()->json([
                'status' => 200,
                'Subcategory' => $Subcategories
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
            'name' => 'required|string|max:45',
            'Image_url' => 'nullable',
            'category_id' => [
                'required',
                Rule::exists('categories', 'id'),
            ],

        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages(),
            ], 422);
        } else {
            $existingSubcategory = subcategory::where('name', $request->name)->first();

            if ($existingSubcategory) {
                // category  with the given name already exists
                return response()->json([
                    'status' => 409,
                    'message' => 'The Subcategory already Exists',
                ], 409);
            } else {
                $Subcategory = subcategory::create([
                    'name' => $request->name,
                    'Image_url' => $request->Image_url,
                    'category_id' => $request->category_id,
                ]);
                if ($Subcategory) {

                    return response()->json([
                        'status' => 200,
                        'message' => 'Subcategory has been created Successfully'
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


    public function Showone($name)
    {
        $Subcategory = subcategory::find($name);
        if ($Subcategory) {
            return response()->json([
                'status' => 200,
                'category' =>  $Subcategory
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => "No such SubCategory is found"
            ], 404);
        }
    }

    public function Update($name, Request $request)
    {
        $Subcategory = subcategory::find($name);
        if ($Subcategory) {
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:45',
                'Image_url' => 'nullable',
                'category_id' => [
                    'required',
                    Rule::exists('categories', 'id'),
                ],

            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => 422,
                    'errors' => $validator->messages(),
                ], 422);
            } else {
                $Subcategory->update([
                    'name' => $request->name,
                    'Image_url' => $request->Image_url,
                    'category_id' => $request->category_id,
                ]);
                return response()->json([
                    'status' => 200,
                    'message' => 'Subcategory has been Updated Successfully'
                ], 200);
            }
        } else {
            return response()->json([
                'status' => 404,
                'message' =>  'No such Subcategory Found',
            ], 404);
        }
    }

    public function Delete($name)
    {
        $Subcategory = subcategory::find($name);

        if ($Subcategory) {
            $Subcategory->delete();
            return response()->json([
                'status' => 200,
                "message" => "Subcategory has been delated successfully"
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                "message" => "No such Subcategory found"
            ], 404);
        }
    }
    public function deleteAll()
    {
        $Subcategories = subcategory::all();

        if ($Subcategories->isEmpty()) {
            return response()->json([
                'status' => 404,
                'message' => 'No records found',
            ], 404);
        }

        foreach ($Subcategories as $Subcategory) {
            $Subcategory->delete();
        }
        // Reset auto-incremented ID for the table (MySQL example)
        DB::statement('ALTER TABLE sub_categories AUTO_INCREMENT = 1');
        return response()->json([
            'status' => 200,
            'message' => 'All Subcategory deleted successfully',
        ], 200);
    }
    //
}
