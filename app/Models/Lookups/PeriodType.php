<?php

namespace App\Models\Lookups;

use Illuminate\Database\Eloquent\Model;

class PeriodType extends Model
{
    public $timestamps = false;

    const MONTH_TYPE = 1;
    const SEMESTER_TYPE = 2;

    public function periods()
    {
        return $this->hasMany(Period::class)->orderBy('start_date');
    }
}
