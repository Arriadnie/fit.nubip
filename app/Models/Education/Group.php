<?php

namespace App\Models\Education;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Group extends Model
{

    protected $fillable = ['name'];

    public function students()
    {
        return $this->hasMany(User::class)->orderBy('name');
    }
}
