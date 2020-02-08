<?php

namespace App\Models\Infoblocks;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use TCG\Voyager\Facades\Voyager;

class InfoblockItem extends Model
{
    use Translatable;
    protected $table = 'infoblock_items';

    protected $guarded = [];

    protected $translatable = ['title'/*, 'sub_title', 'body', 'button_title', 'button_link'*/];




    /**
     * Return the Highest Order Infoblock Item.
     *
     * @param number $parent (Optional) Parent id. Default null
     *
     * @return number Order number
     */
    public static function highestOrderInfoblockItem()
    {
        $order = 1;

        $item = static::orderBy('order', 'DESC')
            ->first();

        if (!is_null($item)) {
            $order = intval($item->order) + 1;
        }

        return $order;
    }
}
