<?php

namespace App\Shortcodes;

use App\Models\Infoblocks\Infoblock;
use App\Models\PeopleInfo\PeopleInfo;
use Illuminate\Database\Eloquent\Model;

class PeopleInfoShortcode extends Model
{
    public function register($shortcode, $content, $compiler, $name, $viewData)
    {
        $infoblock = PeopleInfo::findBySlug($shortcode->code);

        if (!$infoblock) {
            return '';
        }

        return view('people-infos/' . $shortcode->type, [
            'infoblock' => $infoblock
        ]);
    }
}
