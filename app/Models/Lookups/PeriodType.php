<?php

namespace App\Models\Lookups;

use Illuminate\Database\Eloquent\Model;

class PeriodType extends Model
{
    public $timestamps = false;

    public function periods()
    {
        return $this->hasMany(Period::class)->orderBy('start_date');
    }
}
