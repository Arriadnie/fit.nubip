<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class RegisterMail extends Mailable
{
    use Queueable, SerializesModels;


    private $email;
    private $viewName;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($email, $viewName)
    {
        $this->email = $email;
        $this->viewName = $viewName;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from('nulesit@gmail.com', 'IT NULES')
            ->markdown($this->viewName)
            ->to($this->email);
    }
}
