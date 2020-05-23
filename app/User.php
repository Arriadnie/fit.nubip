<?php

namespace App;

use App\Models\PeopleInfo\PeopleInfo;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class User extends \TCG\Voyager\Models\User
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'birthday', 'group_id', 'credit_note_number', 'role_id'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'birthday' => 'date',
    ];


    const STUDENT_ROLE_ID = 3;

    public function peopleInfo()
    {
        return $this->hasOne(PeopleInfo::class, 'user_id', 'id');
    }

    public function save(array $options = [])
    {

        if (!$this->password && setting('users.default-password')) {
            $this->password = Hash::make(setting('users.default-password'));
        }

        parent::save();
    }
}
