<?php

namespace App\Http\Controllers;

use App\Models\Posts\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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
        return view('home');
    }

    public function personalInfo(Request $request) {
        $userInfo = Auth::user()->peopleInfo;
        $userInfo->description = $request->input('description');
        $userInfo->phone = $request->input('phone');
        $userInfo->save();
        $networks = [];
        foreach ($request->request as $key => $value) {
            if (substr($key, 0, 15) == "social-network-" && !is_null($value)) {
                $networks[substr($key, 15)] = ['value' => $value];
            }
        }
        $userInfo->socialNetworks()->sync($networks);

        return redirect()->route('home.index')
            ->with([
                'messages' => [
                    [
                        'text' => __('home.change-info-success'),
                        'type' => 'success',
                    ]
                ],
            ]);
    }
}
