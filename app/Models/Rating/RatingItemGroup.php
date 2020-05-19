<?php

namespace App\Models\Rating;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class RatingItemGroup extends Model
{
    use Translatable;

    protected $translatable = ['name', 'description'];


    public function scopeFirstLevel(Builder $query)
    {
        return $query->whereNull('parent_id');
    }

    public function childrens() {
        return $this->hasMany(self::class, 'parent_id')->orderBy('order');
    }

    public function items()
    {
        return $this->hasMany(RatingItem::class)->orderBy('order');
    }

    public static function getLeafs() {
        $result = [];
        $groups = static::firstLevel()->orderBy('order')->get();

        foreach ($groups as $key => $group) {
            if ($group->items->count() > 0) {
                $resultItem = [
                    'id' => $group->id,
                    'items' => $group->items
                ];
                array_push($result, $resultItem);
            }
            foreach ($group->childrens as $childrenkey => $childrengroup) {
                if ($childrengroup->items->count() > 0) {
                    $resultItem = [
                        'id' => $childrengroup->id,
                        'items' => $childrengroup->items
                    ];
                    array_push($result, $resultItem);
                }
            }
        }
        return $result;

    }

}
