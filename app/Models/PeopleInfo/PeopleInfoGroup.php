<?php

namespace App\Models\PeopleInfo;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class PeopleInfoGroup extends Model
{
    const GRADUATE_GROUP = 1;

    public function infos($count = 0)
    {
        return $this->belongsToMany(PeopleInfo::class, 'people_info_in_group')
            ->orderBy('order', 'ASC')->published()->myTake($count);
    }


    public static function findBySlug($slug) {
        return static::where('slug', $slug)->first();
    }
}
