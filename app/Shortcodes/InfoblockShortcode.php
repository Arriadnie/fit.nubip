<?php

namespace App\Shortcodes;

use App\Models\Infoblocks\Infoblock;
use Illuminate\Database\Eloquent\Model;

class InfoblockShortcode
{
    public function register($shortcode, $content, $compiler, $name, $viewData)
    {
        $infoblock = Infoblock::findBySlug($shortcode->code);

        if (!$infoblock) {
            return '';
        }

        return view('infoblocks/' . $infoblock->type->blade_path . '/index', [
            'infoblock' => $infoblock
        ]);
    }
}
