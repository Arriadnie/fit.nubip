<?php

namespace App\Models\Rating;

use Illuminate\Database\Eloquent\Model;

class UserRatingItem extends Model
{
    protected $guarded = [];
    /**
     * Statuses.
     */
    const STATUS_IN_PROCESS = 'IN_PROCESS';
    const STATUS_EDITED = 'EDITED';
    const STATUS_REJECTED = 'REJECTED';
    const STATUS_CONFIRMED = 'CONFIRMED';

    /**
     * List of statuses.
     * @var array
     */
    public static $statuses = [self::STATUS_IN_PROCESS, self::STATUS_EDITED, self::STATUS_REJECTED, self::STATUS_CONFIRMED];
}
