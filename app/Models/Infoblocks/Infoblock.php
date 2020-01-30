<?php

namespace App\Models\Infoblocks;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;

class Infoblock extends Model
{
    public function items()
    {
        return $this->hasMany(Voyager::modelClass('InfoblockItem'));
    }

    public function type()
    {
        return $this->belongsTo(Voyager::modelClass('InfoblockType'), 'type_id', 'id');
    }


    public static function getViewByEntity($infoblock) {
        return view('infoblocks/index', [
            'infoblock' => $infoblock
        ]);
    }

    public static function getViewBySlug($slug) {
        $infoblock = static::where('slug', $slug)->first();
        return static::getViewByEntity($infoblock);
    }
}
