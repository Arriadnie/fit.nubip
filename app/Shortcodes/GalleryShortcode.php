<?php

namespace App\Shortcodes;

use App\Models\Galleries\Gallery;
use Illuminate\Database\Eloquent\Model;

class GalleryShortcode
{
    public function register($shortcode, $content, $compiler, $name, $viewData)
    {
        $gallery = Gallery::findBySlug($shortcode->code);

        if (!$gallery) {
            return '';
        }
        return view('galleries/index', [
            'gallery' => $gallery
        ]);
    }
}
