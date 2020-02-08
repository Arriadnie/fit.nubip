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


    $namespacePrefix = 'Infoblocks\\';

    Route::group([
        'as'     => 'voyager.infoblocks.',
        'prefix' => 'infoblocks/{infoblock}',
    ], function () use ($namespacePrefix) {
        Route::get('builder', ['uses' => $namespacePrefix.'InfoblockController@builder',    'as' => 'builder']);
        Route::post('order', ['uses' => $namespacePrefix.'InfoblockController@order_item', 'as' => 'order']);

        Route::group([
            'as'     => 'item.',
            'prefix' => 'item',
        ], function () use ($namespacePrefix) {
            Route::delete('{id}', ['uses' => $namespacePrefix.'InfoblockController@delete_item', 'as' => 'destroy']);
            Route::post('/', ['uses' => $namespacePrefix.'InfoblockController@add_item',    'as' => 'add']);
            Route::put('/', ['uses' => $namespacePrefix.'InfoblockController@update_item', 'as' => 'update']);
        });
    });


    //Route::get('infoblocks/{infoblock}/builder', 'Infoblocks\InfoblockController@builder')->name('voyager.infoblocks.builder');
});
