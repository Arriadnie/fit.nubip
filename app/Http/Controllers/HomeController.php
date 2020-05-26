<?php

namespace App\Http\Controllers;

use App\Models\PeopleInfo\PeopleInfo;
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

    private function _getCurrentOrNewPeopleInfo() {
        if (Auth::user()->peopleInfo) {
            return Auth::user()->peopleInfo;
        }
        $info = new PeopleInfo();
        $info->name = Auth::user()->name;
        $info->user_id = Auth::id();
        return $info;
    }

    public function personalInfo(Request $request) {
        $userInfo = $this->_getCurrentOrNewPeopleInfo();
        $userInfo->description = $request->input('description');
        $userInfo->phone = $request->input('phone');
        $userInfo->email = $request->input('email');
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
