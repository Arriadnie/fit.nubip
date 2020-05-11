<?php

namespace App\Models\Education;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class EducationSpecialty extends Model
{
    use Translatable;

    protected $translatable = ['name', 'code', 'description'];
}
