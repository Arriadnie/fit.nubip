<?php

namespace App\Models\Infoblocks;

use App\Traits\Imageable;
use App\Traits\Linkable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use TCG\Voyager\Facades\Voyager;

class InfoblockItem extends Model
{
    use Translatable,
        Imageable,
        Linkable;

    protected $image_column = 'image';
   // protected $table = 'infoblock_items';

    protected $guarded = [];

    protected $translatable = ['title'/*, 'sub_title', 'body', 'button_title', 'button_link'*/];

    public function children()
    {
        return $this->hasMany(self::class, 'parent_id');
    }

    public function scopeFirstLevel(Builder $query, int $count = 0)
    {
        return $query->whereNull('parent_id');
    }


    /**
     * Return the Highest Order Infoblock Item.
     *
     * @param number $parent (Optional) Parent id. Default null
     *
     * @return number Order number
     */
    public static function highestOrderInfoblockItem($parent = null)
    {
        $order = 1;

        $item = static::where('parent_id', '=', $parent)
            ->orderBy('order', 'DESC')
            ->first();

        if (!is_null($item)) {
            $order = intval($item->order) + 1;
        }

        return $order;
    }
}
