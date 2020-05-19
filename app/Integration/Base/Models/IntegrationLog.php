<?php

namespace App\Integration\Base\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class IntegrationLog extends Model
{
    public $timestamps = false;
    /**
     * Statuses.
     */
    const STATUS_SUCCESS = 'SUCCESS';
    const STATUS_ERROR= 'ERROR';

    /**
     * List of statuses.
     *
     * @var array
     */
    public static $statuses = [self::STATUS_SUCCESS, self::STATUS_ERROR];

    protected $fillable = ['status', 'message'];

}
