<?php

namespace App\Shortcodes;

use App\Models\PeopleInfo\PeopleInfoGroup;

class PeopleInfoGroupShortcode
{
    public function register($shortcode, $content, $compiler, $name, $viewData)
    {
        $peopleGroup = PeopleInfoGroup::findBySlug($shortcode->code);
        if (!$peopleGroup) { return ''; }
        if ($shortcode->view) {
            $viewName = $shortcode->view;
        }
        else {
            $viewName = 'student';
        }
        return view('people-infos/groups/' . $viewName, [
            'peopleGroup' => $peopleGroup
        ]);
    }
}
