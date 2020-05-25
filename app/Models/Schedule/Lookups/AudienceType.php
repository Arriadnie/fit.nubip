<?php

namespace App\Models\Schedule\Lookups;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class AudienceType extends Model
{
    use Translatable;

    protected $translatable = ['name'];

    public $timestamps = false;
}
