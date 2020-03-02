<?php

namespace App\Models\Education;

use App\Traits\Imageable;
use Illuminate\Database\Eloquent\Model;

class EducationProgram extends Model
{
    use Imageable;

    protected $image_column = 'image';

    public function degree()
    {
        return $this->belongsTo(EducationDegree::class, 'education_degree_id', 'id');
    }
    public function specialty()
    {
        return $this->belongsTo(EducationSpecialty::class, 'education_specialty_id', 'id');
    }

    public static function getForMainSlider() {
        return static::all();
    }
}
