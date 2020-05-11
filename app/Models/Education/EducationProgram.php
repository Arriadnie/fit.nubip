<?php

namespace App\Models\Education;

use App\Traits\Imageable;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class EducationProgram extends Model
{
    use Translatable, Imageable;

    protected $image_column = 'image';
    protected $translatable = ['name', 'description', 'info_body'];

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
