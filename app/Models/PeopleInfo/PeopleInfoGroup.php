<?php

namespace App\Models\PeopleInfo;

use Illuminate\Database\Eloquent\Model;

class PeopleInfoGroup extends Model
{
    public function infos()
    {
        return $this->belongsToMany(PeopleInfo::class, 'people_info_in_group')
            ->orderBy('order', 'ASC');
    }

    public static function findBySlug($slug) {
        return static::where('slug', $slug)->first();
    }
}
