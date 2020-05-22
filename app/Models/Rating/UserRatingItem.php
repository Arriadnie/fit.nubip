<?php

namespace App\Models\Rating;

use App\Models\Lookups\Period;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Facades\Voyager;

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

    protected $casts = [
        'date' => 'date',
    ];

    public function scopeMyItems(Builder $query) {
        return $query->where('user_id', '=', Auth::id());
    }

    public static function getUserRating($periodId) {
        $period = Period::find($periodId);

        return static::myItems()
            ->where('date', '>=', $period->start_date)
            ->orWhere('date', '<=', $period->due_date)
            ->orderBy('date', 'desc')->get();
    }

    public function ratingItem()
    {
        return $this->belongsTo(RatingItem::class, 'rating_item_id', 'id');
    }
}
