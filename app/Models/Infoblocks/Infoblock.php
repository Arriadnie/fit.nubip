<?php

namespace App\Models\Infoblocks;

use App\Traits\Imageable;
use App\Traits\Linkable;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Resizable;
use TCG\Voyager\Traits\Translatable;

class Infoblock extends Model
{
    use Translatable,
        Imageable,
        Linkable;

    protected $image_column = 'image';
    protected $translatable = ['name', 'slug', 'title', 'sub_title', 'button_title', 'button_link'];


    public function items()
    {
        return $this->hasMany(InfoblockItem::class)->firstLevel()->orderBy('order');
    }

    public function type()
    {
        return $this->belongsTo(InfoblockType::class, 'type_id', 'id');
    }

    public static function findBySlug($slug) {
        return static::where('slug', $slug)->with('type')->with('items')->first();
    }
}
