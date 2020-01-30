<?php

namespace App\Models\Infoblocks;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;

class Infoblock extends Model
{
    public function items()
    {
        return $this->hasMany(InfoblockItem::class);
    }

    public function type()
    {
        return $this->belongsTo(InfoblockType::class, 'type_id', 'id');
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
