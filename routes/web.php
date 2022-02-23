<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ShopController;
use App\Http\Controllers\ProductController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/',[AuthController::class,'index']);
Route::post('/login',[AuthController::class,'login']);
Route::get('/logout',[AuthController::class,'logout']);

Route::middleware(['admin'])->group(function () {
    Route::get('/dashboard',[AuthController::class,'home']);


    Route::match(['post','get'],'/shop',[ShopController::class,'index']);
    Route::get('/shop/setup',[ShopController::class,'setup']);
    Route::get('/shop/setup/{id}',[ShopController::class,'setup']);
    Route::get('/shop/delete/{id}',[ShopController::class,'delete']);
    Route::post('/shop/commit',[ShopController::class,'commit']);
    Route::post('/shop/duplicate',[ShopController::class,'duplicate']);


    Route::match(['post','get'],'/shop',[ProductController::class,'index']);

});