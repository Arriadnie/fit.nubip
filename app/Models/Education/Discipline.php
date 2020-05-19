<?php

namespace App\Models\Education;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Discipline extends Model
{
    use Translatable;

    protected $translatable = ['name'];
    protected $fillable = ['name'];
}
