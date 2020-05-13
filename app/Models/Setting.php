<?php

namespace App\Models;

use App\Traits\Imageable;
use Illuminate\Support\Facades\Storage;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class Setting extends \TCG\Voyager\Models\Setting
{
    public static function getLocalized($name) {
        $value = setting($name . '-' . LaravelLocalization::getCurrentLocale());
        if (empty($value)) {
            $value = setting($name);
        }
        return $value;
    }

    public static function getImage($name) {
        return Imageable::getImageByColumnValue(setting($name), true);
    }
}
