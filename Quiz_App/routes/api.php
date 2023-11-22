<?php

use App\Http\Controllers\Api\Admin_controller;
use App\Http\Controllers\Api\Student_controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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
