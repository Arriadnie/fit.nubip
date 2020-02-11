<?php

namespace App\Models\PeopleInfo;

use App\Traits\Imageable;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class PeopleInfo extends Model
{
    use Translatable,
        Imageable;

    protected $translatable = ['name', 'position', 'description'];
    protected $image_column = 'image';

    /**
     * Statuses.
     */
    const STATUS_PUBLISHED = 'PUBLISHED';
    const STATUS_NOT_PUBLISHED = 'NOT_PUBLISHED';
    const STATUS_CHANGED = 'CHANGED';

    /**
     * List of statuses.
     *
     * @var array
     */
    public static $statuses = [self::STATUS_PUBLISHED, self::STATUS_NOT_PUBLISHED, self::STATUS_CHANGED];

    public static function findBySlug($slug) {
        return static::where('slug', $slug)->first();
    }
}
