<?php

namespace App\Models\Lookups;

use Illuminate\Database\Eloquent\Model;

class Period extends Model
{
    public $timestamps = false;


    public static function getByDate($date) {
        return static::where('start_date', '<=', $date)->where('due_date', '>=', $date)->where('period_type_id', '=', PeriodType::MONTH_TYPE)->first();
    }

    public function type() {
        return $this->belongsTo(PeriodType::class, 'period_type_id', 'id');
    }
}
