<?php

namespace App\Shortcodes;

use App\Models\PeopleInfo\PeopleInfo;

class PeopleInfoShortcode
{
    public function register($shortcode, $content, $compiler, $name, $viewData)
    {
        $people = PeopleInfo::findBySlug($shortcode->code);
        if (!$people) { return ''; }
        if ($shortcode->view) {
            $viewName = $shortcode->view;
        }
        else {
            $viewName = 'student';
        }
        return view('people-infos/' . $viewName, [
            'people' => $people
        ]);
    }
}
