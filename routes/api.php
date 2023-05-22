<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\User\UserController;
use App\Http\Controllers\Tasks\TasksController;
use App\Http\Controllers\Tasks\TasksListController;


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

Route::group([

    'middleware' => 'api',
    'prefix' => 'auth'

], function ($router) {

    // Sign in and register User
    Route::get('me', [AuthController::class, 'me'])->name('me.index');
    Route::post('login', [AuthController::class, 'login'])->name('auth.login');
    Route::post('logout', [AuthController::class, 'logout'])->name('auth.logout');
    Route::post('register', [AuthController::class, 'register'])->name('auth.register');

    // User
    Route::get('user', [UserController::class, 'index'])->name('user.index');
    Route::get('showus/{id}', [UserController::class, 'show'])->name('user.show');
    Route::put('updateus/{id}', [UserController::class, 'update'])->name('user.update');
    Route::delete('deleteus/{id}', [UserController::class, 'delete'])->name('user.delete');

    // Tasklist
    Route::get('tkl', [TasksListController::class, 'index'])->name('tkl.index');
    Route::get('showtkl/{code}', [TasksListController::class, 'show'])->name('tkl.show');
    Route::post('createtkl', [TasksListController::class, 'store'])->name('tkl.create');
    Route::put('updatetkl/{code}', [TasksListController::class, 'update'])->name('tkl.update');
    Route::delete('deletetkl/{id}', [TasksListController::class, 'delete'])->name('tkl.delete');

    // Task
    Route::get('tk', [TasksController::class, 'index'])->name('tk.index');
    Route::get('allTask', [TasksController::class, 'allTask'])->name('tk.all');
    Route::get('showtk/{id}', [TasksController::class, 'show'])->name('tk.show');
    Route::post('createtk', [TasksController::class, 'store'])->name('tk.create');
    Route::put('updatetk/{id}', [TasksController::class, 'update'])->name('tk.update');
    Route::delete('deletetk/{id}', [TasksController::class, 'delete'])->name('tk.delete');

});
