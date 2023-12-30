<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class Category_controller extends Controller
{
    public function index()
    {
        return "hellow it is category Api Bro";
    }
    public function Showall()
    {

        $categories = category::with(['normal_questions' => function ($query) {
            $query->select('id', 'category_id', 'question');
        }])

            ->get(['id', 'name', 'Image_url', 'description', 'categoryType', 'updated_at']);

        if ($categories->count() > 0) {
            return response()->json([
                'status' => 200,
                'categories' => $categories,

            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'There is no data recorded'
            ], 404);
        }
    }
    public function  ShowGeneralTypeCategories()
    {
        // Fetch categories where categoryType is "general"
        $categories = Category::where('categoryType', 'general')->get();

        return response()->json([
            'status' => 200,
            'categories' => $categories,
        ]);
    }
    public function   ShowAcadamicTypeCategories()
    {
        // Fetch categories where categoryType is "general"
        $categories = Category::where('categoryType', 'acadamic')->get();

        return response()->json([
            'status' => 200,
            'categories' => $categories,
        ]);
    }


    public function Addnew(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:45',
            'Image_url' => 'nullable',
            'description' => 'string',
            'categoryType' => [
                'required',
                Rule::in(['acadamic', 'general', 'missions']),
            ],
        ]);
        // $hashedPassword = Hash::make($request->password);
        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages(),
            ], 422);
        } else {
            $existingCategory = category::where('name', $request->name)->first();

            if ($existingCategory) {
                // category  with the given name already exists
                return response()->json([
                    'status' => 409,
                    'message' => 'The category already Exists',
                ], 409);
            } else {
                $category = category::create([
                    'name' => $request->name,
                    'description' => $request->description,
                    'Image_url' => $request->input('Image_url', "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/94/74/da/9474da4e-9a1e-d8ac-39b8-818229b05c47/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1024x1024.jpg"),
                    'categoryType' => $request->categoryType,
                ]);
                if ($category) {

                    return response()->json([
                        'status' => 200,
                        'message' => 'Category has been created Successfully'
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
        $category = category::find($id);
        if ($category) {
            return response()->json([
                'status' => 200,
                'category' =>  $category
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => "No such Category is found"
            ], 404);
        }
    }

    public function Update($id, Request $request)
    {
        $category = category::find($id);
        if ($category) {
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:45',
                'Image_url' => 'nullable',
                'description' => 'string',
                'categoryType' => [
                    'required',

                    Rule::in(['acadamic', 'general', 'missions']),
                ],
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => 422,
                    'errors' => $validator->messages(),
                ], 422);
            } else {
                $category->update([
                    'name' => $request->name,
                    'description' => $request->description,
                    'Image_url' => $request->Image_url,
                    'categoryType' => $request->categoryType,
                ]);
                return response()->json([
                    'status' => 200,
                    'message' => 'category has been Updated Successfully'
                ], 200);
            }
        } else {
            return response()->json([
                'status' => 404,
                'message' =>  'No such categry Found',
            ], 404);
        }
    }

    public function Delete($id)
    {
        $category = category::find($id);

        if ($category) {
            $category->delete();
            return response()->json([
                'status' => 200,
                "message" => "category has been delated successfully"
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                "message" => "No such category found"
            ], 404);
        }
    }
    public function deleteAll()
    {
        $categoris = category::all();

        if ($categoris->isEmpty()) {
            return response()->json([
                'status' => 404,
                'message' => 'No records found',
            ], 404);
        }

        foreach ($categoris as $category) {
            $category->delete();
        }
        // Reset auto-incremented ID for the table (MySQL example)
        DB::statement('ALTER TABLE categories AUTO_INCREMENT = 1');
        return response()->json([
            'status' => 200,
            'message' => 'All category deleted successfully',
        ], 200);
    }
}
