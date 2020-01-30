<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Mail;
use App\mail\RegisterMail;

class MailController extends Controller
{
    public function send() {
        Mail::send(new RegisterMail('vlad_litvinchyk@ukr.net', 'mails.registermail'));
    }
    public function email() {
        return view('mails.registermail');
    }
}
