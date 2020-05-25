<?php

namespace App\Models\Schedule;

use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{

    const FREQUENCY_FULL = 'FULL';
    const FREQUENCY_NUMERATOR = 'NUMERATOR';
    const FREQUENCY_DENOMINATOR = 'DENOMINATOR';

    public static $frequencies = [self::FREQUENCY_FULL, self::FREQUENCY_NUMERATOR, self::FREQUENCY_DENOMINATOR];

}
