<?php

namespace App\Http\Controllers;

use App\Models\Infoblocks\Infoblock;
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
        $slider = Infoblock::first();
        $sliderView = Infoblock::getViewByEntity($slider);

        return view('home', [
            'slider' => $sliderView
        ]);
    }
}
