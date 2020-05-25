<?php

namespace App\Models\Education;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Faculty extends Model
{
    use Translatable;

    protected $translatable = ['name'];
}
