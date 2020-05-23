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


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    $namespacePrefix = 'WithItemsBase\\';
    Route::group([
        'as'     => 'voyager.infoblocks.',
        'prefix' => 'infoblocks/{master}',
    ], function () use ($namespacePrefix) {
        Route::get('items', ['uses' => $namespacePrefix.'BaseWithItemsController@builder',    'as' => 'items']);
        Route::post('order', ['uses' => $namespacePrefix.'BaseWithItemsController@order_item', 'as' => 'order']);

        Route::group([
            'as'     => 'items.',
            'prefix' => 'items',
        ], function () use ($namespacePrefix) {
            Route::delete('{id}', ['uses' => $namespacePrefix.'BaseWithItemsController@delete_item', 'as' => 'destroy']);
            Route::post('/', ['uses' => $namespacePrefix.'BaseWithItemsController@add_item',    'as' => 'add']);
        });
    });

    Route::group([
        'as'     => 'voyager.galleries.',
        'prefix' => 'galleries/{master}',
    ], function () use ($namespacePrefix) {
        Route::get('items', ['uses' => $namespacePrefix.'BaseWithItemsController@builder',    'as' => 'items']);
        Route::post('order', ['uses' => $namespacePrefix.'BaseWithItemsController@order_item', 'as' => 'order']);

        Route::group([
            'as'     => 'items.',
            'prefix' => 'items',
        ], function () use ($namespacePrefix) {
            Route::delete('{id}', ['uses' => $namespacePrefix.'BaseWithItemsController@delete_item', 'as' => 'destroy']);
            Route::post('/', ['uses' => $namespacePrefix.'BaseWithItemsController@add_item',    'as' => 'add']);
        });
    });

    Route::group([
        'as'     => 'voyager.rating-item-groups.',
        'prefix' => 'rating-item-groups/{master}',
    ], function () use ($namespacePrefix) {
        Route::get('items', ['uses' => $namespacePrefix.'BaseWithItemsController@builder',    'as' => 'items']);
        Route::post('order', ['uses' => $namespacePrefix.'BaseWithItemsController@order_item', 'as' => 'order']);
        Route::group([
            'as'     => 'items.',
            'prefix' => 'items',
        ], function () use ($namespacePrefix) {
            Route::delete('{id}', ['uses' => $namespacePrefix.'BaseWithItemsController@delete_item', 'as' => 'destroy']);
            Route::post('/', ['uses' => $namespacePrefix.'BaseWithItemsController@add_item',    'as' => 'add']);
        });

    });


});

Route::get('/integration', 'Integration\IntegrationController@start')->name('integration');

Route::group(
    [
        'prefix' => LaravelLocalization::setLocale(),
        'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]
    ], function()
{
    /** ADD ALL LOCALIZED ROUTES INSIDE THIS GROUP **/
    Route::get('/', function () {
        return view('welcome')->withShortcodes();
    });

    Route::group([], function () {
        Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
        Route::post('login', 'Auth\LoginController@login');
        Route::post('logout', 'Auth\LoginController@logout')->name('logout');
        // Registration Routes...
        //Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('register');
        Route::post('register', 'Auth\RegisterController@register')->name('register');
        // Password Reset Routes...
        Route::get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
        Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
        Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
        Route::post('password/reset', 'Auth\ResetPasswordController@reset')->name('password.update');
    });





    Route::group([], function () {
        Route::get('/posts', 'Posts\PostController@publicIndex')->name('posts');
        Route::get('/post/{slug?}', 'Posts\PostController@publicShow')->name('post');
        Route::post('/post-service', 'Posts\PostController@postService')->name('post-service');
    });

    Route::group([
        'as'     => 'education.courses.',
        'prefix' => 'education/courses'
    ], function () {
        Route::get('/', 'Education\EducationController@coursesIndex')->name('index');
        Route::get('/{degreeSlug}', 'Education\EducationController@coursesShow')->name('show');
    });

    Route::group([
        'as'     => 'home.',
        'prefix' => 'home'
    ], function () {
        Route::get('/', 'HomeController@index')->name('index');
        Route::post('/personal-info', 'HomeController@personalInfo')->name('personal-info');

        Route::get('/change-password', 'Auth\ChangePasswordController@showForm')->name('change-password');
        Route::post('/change-password-post', 'Auth\ChangePasswordController@change')->name('change-password-post');

        Route::group([
            'as'     => 'rating.',
            'prefix' => 'rating',
        ], function () {
            Route::get('/entering', 'Rating\RatingController@entering')->name('entering');
            Route::get('/personal', 'Rating\RatingController@personal')->name('personal');
            Route::get('/starosta', 'Rating\RatingController@starosta')->name('starosta');
            Route::get('/report', 'Rating\RatingController@report')->name('report');

            Route::post('/create-personal', 'Rating\RatingController@createPersonal')->name('create-personal');
            Route::post('/get-personal', 'Rating\RatingController@service')->name('get-personal');
            Route::post('/edit', 'Rating\RatingController@edit')->name('edit');
            Route::post('/confirm', 'Rating\RatingController@confirm')->name('confirm');
            Route::post('/delete', 'Rating\RatingController@delete')->name('delete');


        });
    });





    Route::get('{pageSlug}', 'Pages\PageController@show');
});
