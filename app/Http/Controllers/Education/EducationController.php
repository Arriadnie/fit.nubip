<?php

namespace App\Http\Controllers\Education;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Education\EducationDegree;

class EducationController extends Controller
{
    public function coursesIndex() {
        return view('education/courses-index/index', [
            'degrees' => EducationDegree::orderBy('order')->get()
        ]);
    }

    public function coursesShow($degreeSlug) {
        return view('education/courses-show/index', [
            'degree' => EducationDegree::findBySlug($degreeSlug)
        ]);
    }

}
