<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Validator;

class ChangePasswordController extends Controller
{
    public function showForm(Request $request, $token = null)
    {
        return view('auth.change-password');
    }

    public function change(Request $request)
    {
        $user = Auth::user();
        $passwords = $request->only([
            'password-old', 'password-new', 'password-confirm'
        ]);

        $validator = $this->validator($passwords);

        if ( $validator->fails() )
            return back()
                ->withErrors($validator)
                ->withInput()
                ->with([
                    'messages' => [[
                        'text' => __('home.password-change-error'),
                        'type' => 'error',
                    ]],
                ]);

        if ($passwords['password-new'] !== $passwords['password-confirm']) {
            return back()
                ->with([
                    'messages' => [[
                        'text' => __('home.password-change-coincidence'),
                        'type' => 'error',
                    ]],
                ]);
        }

        $user->password = Hash::make($passwords['password-new']);
        $user->save();

        return redirect()->route('home.index')
            ->with([
                'messages' => [[
                    'text' => __('home.password-change-success'),
                    'type' => 'success',
                ]],
            ]);
    }


    protected function validator(array $data)
    {
        return Validator::make($data, [
            'password-old' => ['current_password_match'],
            'password-new' => ['required', 'string', 'min:8'],
            'password-confirm' => ['required', 'string', 'min:8'],
        ]);
    }

}
