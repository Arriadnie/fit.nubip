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
        try {
            $path = json_decode($this[$this->image_column])[0]->download_link;
        }
        catch (\Exception $exception) {
            $path = $this[$this->image_column];
        }

        if ($storage) {
            return Voyager::image($path);
        }
        return $path;
    }
}
