<?php

namespace App\Models\Infoblocks;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;

class Infoblock extends Model
{
    public function items()
    {
        return $this->hasMany(InfoblockItem::class)->orderBy('order');
    }

    public function type()
    {
        return $this->belongsTo(InfoblockType::class, 'type_id', 'id');
    }

    public static function findBySlug($slug) {
        return static::where('slug', $slug)->first();
    }


    public static function getViewByEntity($infoblock) {
        return view('infoblocks/index', [
            'infoblock' => $infoblock
        ]);
    }

    public static function getViewBySlug($slug) {
        $infoblock = static::findBySlug($slug);
        return static::getViewByEntity($infoblock);
    }
}
