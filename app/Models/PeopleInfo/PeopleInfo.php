<?php

namespace App\Models\PeopleInfo;

use App\Models\SocialNetwork;
use App\Traits\Imageable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class PeopleInfo extends Model
{
    use Translatable,
        Imageable;

    protected $translatable = ['name', 'description'];
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

    public function scopeMyTake(Builder $query, int $count = 0)
    {
        if ($count > 0) {
            return $query->take($count);
        }
        return $query;
    }

    public function socialNetworks() {
        return $this->belongsToMany(SocialNetwork::class, 'people_info_social_networks',
            'people_info_id', 'social_network_id')
            ->withPivot('value');
    }

    public function getSocialNetworksWithEmpty() {
        $all = SocialNetwork::where('is_public', '=', true)->get();
        $myWithEmpty = [];

        foreach ($all as $key => $item) {
            $current = $this->_getSocialNetworkById($item->id);
            $resultItem = [
                'network' => $item,
                'value' => !is_null($current) ? $current->pivot->value : ''
            ];
            array_push($myWithEmpty, $resultItem);
        }
        return $myWithEmpty;
    }
    private function _getSocialNetworkById($id) {
        foreach ($this->socialNetworks as $key => $item) {
            if ($item->id == $id) {
                return $item;
            }
        }
        return null;
    }
}
