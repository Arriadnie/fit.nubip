<?php

namespace App\Traits;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;

trait Imageable
{


    /**
     * Get full path to image (from image or file type)
     *
     * @param boolean   $storage
     * @return string
     */
    public function getImage($storage = false)
    {
        return static::getImageByColumnValue($this[$this->image_column], $storage);
    }


    public static function getImageByColumnValue($image, $storage = false)
    {
        try {
            $path = json_decode($image)[0]->download_link;
        }
        catch (\Exception $exception) {
            $path = $image;
        }

        if ($storage) {
            return Voyager::image($path);
        }
        return $path;
    }

}
