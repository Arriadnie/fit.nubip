<?php

namespace App\Models\Lookups;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Period extends Model
{
    public $timestamps = false;


    public static function getMonthByDate($date) {
        return static::where('start_date', '<=', $date)->where('due_date', '>=', $date)->months()->first();
    }

    public function type() {
        return $this->belongsTo(PeriodType::class, 'period_type_id', 'id');
    }

    public function scopeSemesters(Builder $query) {
        return $query->where('period_type_id', '=', PeriodType::SEMESTER_TYPE);
    }
    public function scopeMonths(Builder $query) {
        return $query->where('period_type_id', '=', PeriodType::MONTH_TYPE);
    }
}
