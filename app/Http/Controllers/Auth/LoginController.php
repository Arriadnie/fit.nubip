<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }


    public function showLoginForm()
    {
        return view('auth.index');
    }

    public function loginWithCreditNote(Request $request)
    {
        if ($request->has('credit_note_number')) {
            $this->loginParameter = 'credit_note_number';
        } else {
            $this->loginParameter = 'email';
        }
        Session::put('loginWithZalicNote', $request->has('credit_note_number'));
        //dd(!is_null($request->input('credit_note_number')));
        return $this->login($request);
    }

    private $loginParameter;

    public function username()
    {
        return $this->loginParameter;
    }

}
