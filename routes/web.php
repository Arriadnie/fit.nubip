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
    return view('welcome')->withShortcodes();
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/send', 'MailController@send')->name('send');

Route::get('/posts', 'Posts\PostController@publicIndex')->name('posts');
Route::get('/post/{slug?}', 'Posts\PostController@publicShow')->name('post');
Route::post('/postService', 'Posts\PostController@postService')->name('postService');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    $namespacePrefix = 'WithItemsBase\\';
    Route::group([
        'as'     => 'voyager.infoblocks.',
        'prefix' => 'infoblocks/{master}',
    ], function () use ($namespacePrefix) {
        Route::get('builder', ['uses' => $namespacePrefix.'BaseWithItemsController@builder',    'as' => 'builder']);
        Route::post('order', ['uses' => $namespacePrefix.'BaseWithItemsController@order_item', 'as' => 'order']);

        Route::group([
            'as'     => 'item.',
            'prefix' => 'item',
        ], function () use ($namespacePrefix) {
            Route::delete('{id}', ['uses' => $namespacePrefix.'BaseWithItemsController@delete_item', 'as' => 'destroy']);
            Route::post('/', ['uses' => $namespacePrefix.'BaseWithItemsController@add_item',    'as' => 'add']);
        });
    });

    Route::group([
        'as'     => 'voyager.galleries.',
        'prefix' => 'galleries/{master}',
    ], function () use ($namespacePrefix) {
        Route::get('builder', ['uses' => $namespacePrefix.'BaseWithItemsController@builder',    'as' => 'builder']);
        Route::post('order', ['uses' => $namespacePrefix.'BaseWithItemsController@order_item', 'as' => 'order']);

        Route::group([
            'as'     => 'item.',
            'prefix' => 'item',
        ], function () use ($namespacePrefix) {
            Route::delete('{id}', ['uses' => $namespacePrefix.'BaseWithItemsController@delete_item', 'as' => 'destroy']);
            Route::post('/', ['uses' => $namespacePrefix.'BaseWithItemsController@add_item',    'as' => 'add']);
        });
    });


});

Route::get('{pageSlug}', 'Pages\PageController@show');
