<?php

namespace App\Models\Pages;

use App\Traits\Imageable;
use App\Traits\Linkable;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Page extends \TCG\Voyager\Models\Page
{
    use Imageable;

    protected $image_column = 'image';

    public static function findBySlug($slug) {
        return static::where('slug', $slug)->first();
    }
}
