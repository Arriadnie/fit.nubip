<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ContactInfo extends Model
{
    /**
     * Types.
     */
    const TYPE_PHONE = 'PHONE';
    const TYPE_EMAIL = 'EMAIL';
    const TYPE_GEO = 'GEO';

    /**
     * List of types.
     *
     * @var array
     */
    public static $types = [self::TYPE_PHONE, self::TYPE_EMAIL, self::TYPE_GEO];
}
