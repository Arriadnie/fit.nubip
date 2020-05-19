<?php

namespace App\Models\Rating;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class RatingItem extends Model
{
    use Translatable;

    protected $translatable = ['name', 'description'];

    protected $guarded = [];
}
