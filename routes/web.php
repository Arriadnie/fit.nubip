<?php

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/send', 'MailController@send')->name('send');

Route::get('/posts', 'Posts\PostController@publicIndex')->name('posts');
Route::get('/post/{slug?}', 'Posts\PostController@publicShow')->name('post');
Route::post('/postService', 'Posts\PostController@postService')->name('postService');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

//Route::get('/', ['as' => 'homepage', 'uses' => 'PageController@index']);



Route::any('{any?}', function($any) {
    if (view()->exists($any)) {
        return view($any)->render();
    }
    return abort(404);
})->where(['any' => '.*']);
