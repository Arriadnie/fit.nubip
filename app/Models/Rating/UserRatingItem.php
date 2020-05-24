<?php

namespace App\Models\Rating;

use App\Models\Lookups\Period;
use App\User;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Facades\Voyager;

class UserRatingItem extends Model
{
    protected $guarded = [];

    const STATUS_IN_PROCESS = 'IN_PROCESS';
    const STATUS_EDITED = 'EDITED';
    const STATUS_REJECTED = 'REJECTED';
    const STATUS_CONFIRMED = 'CONFIRMED';

    public static $statuses = [self::STATUS_IN_PROCESS, self::STATUS_EDITED, self::STATUS_REJECTED, self::STATUS_CONFIRMED];

    protected $casts = [
        'date' => 'date',
    ];

    public function scopeMyItems(Builder $query) {
        return $query->where('user_id', '=', Auth::id());
    }
    public function scopeStarostaGroupItems(Builder $query) {
        return $query->select('user_rating_items.*')
            ->join('users', 'users.id', '=', 'user_rating_items.user_id')
            ->join('groups', 'groups.id', '=', 'users.group_id')
            ->where('user_rating_items.status', '=', static::STATUS_IN_PROCESS)
            ->where('groups.starosta_id', '=', Auth::id());
    }

    public static function getUserRating($periodId) {
        $period = Period::find($periodId);

        return static::myItems()
            ->whereBetween('date', [$period->start_date, $period->due_date])
            ->with('ratingItem')
            ->orderBy('date', 'desc')->get();
    }
    public static function getStarostaRating() {

        return static::starostaGroupItems()
            ->with('ratingItem')
            ->orderBy('date', 'desc')->get();
    }

    public function ratingItem()
    {
        return $this->belongsTo(RatingItem::class, 'rating_item_id', 'id');
    }
    public function user() {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }


    public function getStatus() {
        if ($this->status === static::STATUS_IN_PROCESS) {
            return [
                'icon' => 'load',
                'name' => 'В обробці'
            ];
        }
        if ($this->status === static::STATUS_EDITED) {
            return [
                'icon' => 'edit',
                'name' => 'Відредаговано'
            ];
        }if ($this->status === static::STATUS_REJECTED) {
            return [
                'icon' => 'error',
                'name' => 'Відхилено'
            ];
        }
        if ($this->status === static::STATUS_CONFIRMED) {
            return [
                'icon' => 'success',
                'name' => 'Підтверджено'
            ];
        }
        return [];
    }

    public function getActions() {
        if ($this->status === static::STATUS_IN_PROCESS) {
            return [$this->_getChangeAction(), $this->_getDeleteAction()];
        }
        if ($this->status === static::STATUS_EDITED) {
            return [$this->_getConfirmAction(), $this->_getChangeAction(), $this->_getDeleteAction()];
        }
        if ($this->status === static::STATUS_REJECTED) {
            return [$this->_getChangeAction(), $this->_getDeleteAction()];
        }
        return [];
    }

    public function getStarostaActions() {
        return [$this->_getConfirmAction(), $this->_getChangeAction(), $this->_getRejectAction()];
    }

    private function _getChangeAction() {
        return [
            'class' => 'change',
            'title' => 'Змінити'
        ];
    }
    private function _getDeleteAction() {
        return [
            'class' => 'delete',
            'title' => 'Видалити'
        ];
    }
    private function _getConfirmAction() {
        return [
            'class' => 'confirm',
            'title' => 'Підтвердити'
        ];
    }
    private function _getRejectAction() {
        return [
            'class' => 'deny',
            'title' => 'Відхилити'
        ];
    }
}
