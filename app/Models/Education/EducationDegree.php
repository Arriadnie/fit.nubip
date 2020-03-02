<?php

namespace App\Models\Education;

use App\Traits\Imageable;
use Illuminate\Database\Eloquent\Model;

class EducationDegree extends Model
{
    use Imageable;

    protected $image_column = 'image';

    public function programs()
    {
        return $this->hasMany(EducationProgram::class)->orderBy('order')->with('specialty');
    }


    public function getSpecialtiesWithPrograms() {
        $programs = $this->programs()->get();

        $specialties = [];
        foreach ($programs as $program) {
            $specI = static::searchSpecialty($specialties, $program->specialty);
            $specialties[$specI]['programs'][] = $program;
        }
        return $specialties;
    }
    private static function searchSpecialty(&$array, &$specialty) {
        foreach ($array as $key => $el) {
            if ($el['specialty'] == $specialty) {
                return $key;
            }
        }
        $el = [
            'specialty' => $specialty,
            'programs' => []
        ];
        $array[] = $el;
        return count($array) - 1;
    }

    public static function findBySlug($slug) {
        return static::where('slug', $slug)->with('programs')->firstOrFail();
    }
}
