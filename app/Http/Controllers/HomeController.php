<?php

namespace App\Http\Controllers;

use App\Models\Posts\Post;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $posts = Post::getByCategory(1, 0, 6);
        $sliderView = view('posts/includes/card-collection', [
            'posts' => $posts
        ]);

        return view('home', [
            'sliderView' => $sliderView
        ]);
    }
}
