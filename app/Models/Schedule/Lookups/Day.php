<?php

namespace App\Models\Schedule\Lookups;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Day extends Model
{
    use Translatable;

    protected $translatable = ['name'];

    public $timestamps = false;


    public static function getAll() {
        return static::orderBy('order')->get();
    }
}
