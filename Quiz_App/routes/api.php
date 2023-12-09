<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\Admin_controller;
use App\Http\Controllers\Api\Student_controller;
use App\Http\Controllers\Api\Category_controller;
use App\Http\Controllers\Api\Subcategory_controller;
use App\Http\Controllers\Api\NormalQuestion_controller;
use App\Http\Controllers\Api\Options_controller;
use App\Http\Controllers\Api\Score_controller;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => ['auth:sanctum']], function () {
});
// Route::post('/login', [AuthController::class, 'signin'])->middleware('auth:student');
// Route::get('/login', 'AuthController@signin')->name('login');
// ------------------------Admin Apis--------------
Route::get('admins', [Admin_controller::class, 'index']);
Route::get('admins/Showall', [Admin_controller::class, 'Showall']);
Route::post('admins/Addnew', [Admin_controller::class, 'Addnew']);
Route::get('admins/{id}', [Admin_controller::class, 'Showone']);
Route::put('admins/{id}/Update', [Admin_controller::class, 'Update']);
Route::delete('admins/{id}/Delete', [Admin_controller::class, 'Delete']);
Route::delete('admins/DeleteAll', [Admin_controller::class, 'DeleteAll']);
// ------------------------Student Apis--------------
Route::get('students', [Student_controller::class, 'index']);
Route::get('students/Showall', [Student_controller::class, 'Showall']);
Route::post('students/Addnew', [Student_controller::class, 'Addnew']);
Route::get('students/{id}', [Student_controller::class, 'Showone']);
Route::put('students/{id}/Update', [Student_controller::class, 'Update']);
Route::delete('students/{id}/Delete', [Student_controller::class, 'Delete']);
Route::delete('students/DeleteAll', [Student_controller::class, 'DeleteAll']);
Route::post('students/login', [Student_controller::class, 'login']);
Route::get('stdents/getTopTenStudentsByPoints', [Student_controller::class, 'getTopTenStudentsByPoints']);
// ------------------------category Apis--------------
Route::get('categories', [Category_controller::class, 'index']);
Route::get('categories/Showall', [Category_controller::class, 'Showall']);
Route::get('categories/ShowAcadamicTypeCategories', [Category_controller::class, 'ShowAcadamicTypeCategories']);
Route::get('categories/ShowGeneralTypeCategories', [Category_controller::class, 'ShowGeneralTypeCategories']);
Route::post('categories/Addnew', [Category_controller::class, 'Addnew']);
Route::get('categories/{id}', [Category_controller::class, 'Showone']);
Route::put('categories/{id}/Update', [Category_controller::class, 'Update']);
Route::delete('categories/{id}/Delete', [Category_controller::class, 'Delete']);
Route::delete('categories/DeleteAll', [Category_controller::class, 'DeleteAll']);
// ------------------------Subcategory Apis--------------
Route::get('subcategories', [Subcategory_controller::class, 'index']);
Route::get('subcategories/Showall', [Subcategory_controller::class, 'Showall']);
Route::post('subcategories/Addnew', [Subcategory_controller::class, 'Addnew']);
Route::get('subcategories/{id}', [Subcategory_controller::class, 'Showone']);
Route::put('subcategories/{id}/Update', [Subcategory_controller::class, 'Update']);
Route::delete('subcategories/{id}/Delete', [Subcategory_controller::class, 'Delete']);
Route::delete('subcategories/DeleteAll', [Subcategory_controller::class, 'DeleteAll']);
// ------------------------NormalQuestions Apis--------------
Route::get('normalQuestions', [NormalQuestion_controller::class, 'index']);
Route::get('normalQuestions/Showall', [NormalQuestion_controller::class, 'Showall']);
Route::post('normalQuestions/Addnew', [NormalQuestion_controller::class, 'Addnew']);
Route::get('normalQuestions/{id}', [NormalQuestion_controller::class, 'Showone']);
Route::put('normalQuestions/{id}/Update', [NormalQuestion_controller::class, 'Update']);
Route::delete('normalQuestions/{id}/Delete', [NormalQuestion_controller::class, 'Delete']);
Route::delete('normalQuestions/DeleteAll', [NormalQuestion_controller::class, 'DeleteAll']);
// ------------------------Options Apis--------------
Route::get('options', [Options_controller::class, 'index']);
Route::get('options/Showall', [Options_controller::class, 'Showall']);

Route::post('options/Addnew', [Options_controller::class, 'Addnew']);
Route::get('options/{id}', [Options_controller::class, 'Showone']);
Route::put('options/{id}/Update', [Options_controller::class, 'Update']);
Route::delete('options/{id}/Delete', [Options_controller::class, 'Delete']);
Route::delete('options/DeleteAll', [Options_controller::class, 'DeleteAll']);
// ------------------------ Score Apis-------------------------------------
Route::get('scores', [Score_controller::class, 'index']);
Route::get('scores/Showall', [Score_controller::class, 'Showall']);

Route::post('scores/Addnew', [Score_controller::class, 'Addnew']);
Route::get('scores/{id}', [Score_controller::class, 'Showone']);
Route::put('scores/{id}/UpdateScorePoint', [Score_controller::class, 'UpdateScorePoint']);
Route::put('scores/{id}/UpdateBroadcastScore', [Score_controller::class, 'UpdateBroadcastScore']);
Route::delete('scores/{id}/Delete', [Score_controller::class, 'Delete']);
Route::delete('scores/DeleteAll', [Score_controller::class, 'DeleteAll']);
