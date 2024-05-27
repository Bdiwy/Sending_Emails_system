<?php

use App\Mail\Gmail;
use Illuminate\Routing\RouteGroup;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Route;

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


Auth::routes();

Route::middleware('auth')->group(function () {

    // Route::get('/register');

    Route::get('/', function () {
        return view('welcome2');
        // return view('gmail');
    });
    Route::get('/home', function () {
        return view('welcome2');
        // return view('gmail');
    });
    Route::get('/gmail', function () {
        // return view('welcome');
        return view('gmail');
    });

/*
Route::get('/gmail', function () {
    return Mail::to('infosayed71@gmail.com')->send(new Gmail()) ;
});
*/
// Send emails
Route::post('/send','EmailController@sendEmailAutomatic');

// get number of emails
Route::post('/getnumber','EmailController@getEmailsNumber');

// Show data 
Route::get('/showData','EmailController@showData');
// Route::get('/showData',function () {
    //     return
    // });
    
// Add files to current
Route::post('/addfile','EmailController@addFilesToCurrent');

// Add files from scrach
Route::post('/store','EmailController@uploadScrach');

// Delete all emails
Route::post('/delete','EmailController@deleteEmail');

// Delete one email 
Route::post('/deleteone','EmailController@deleteOne');

// store new template
Route::post('/templatestore','EmailController@store_temp');

// show all templates
Route::get('/showTemplate','EmailController@showTemplate');
Route::get('/template/{id}','EmailController@oneTemplate');
Route::post('/deletetempone','EmailController@deletetempone');
});
