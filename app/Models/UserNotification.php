<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class UserNotification extends Model
{

    const TYPE_SUCCESS = 'SUCCESS';
    const TYPE_ERROR = 'ERROR';
    const TYPE_INFO = 'INFO';

    public static $types = [self::TYPE_SUCCESS, self::TYPE_ERROR, self::TYPE_INFO];

    protected $guarded = [];

    public function scopeCurrentUsers(Builder $query)
    {
        return $query->where('user_id', '=', Auth::id());
    }

}
