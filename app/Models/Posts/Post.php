<?php

namespace App\Models\Posts;

use App\Traits\Imageable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;

class Post extends \TCG\Voyager\Models\Post
{
    use Imageable;

    protected $image_column = 'image';

    const STATUS_PENDING = 'PENDING';


    public function save(array $options = [])
    {

        parent::save();
    }

    /*public function categories()
    {
        return $this->belongsToMany(Voyager::modelClass('Category'));
    }*/

    public function author()
    {
        return parent::authorId();
    }

    public function scopeLast(Builder $query, int $count = 0)
    {
        $result = $query->orderBy('created_at', 'desc');
        if ($count > 0) {
            $result = $result->take($count);
        }
        return $result;
    }

    public static function getPostsForMainPage() {
        $count = setting('posts.count-on-main-page');
        $requiredPosts = Post::where('featured', '=', 1)->last($count)->published()->get();

        if ($requiredPosts->count() < $count) {
            $notRequiredPosts = Post::where('featured', '=', 0)->last($count - $requiredPosts->count())->published()->get();
            $result = [];
            foreach ($requiredPosts as $post) {
                array_push($result, $post);
            }
            foreach ($notRequiredPosts as $post) {
                array_push($result, $post);
            }
            $requiredPosts = $result;
        }

        return $requiredPosts;
    }


    public function getPostDateMonth() {
        return static::getMonthName($this->created_at->format('m'));
    }


    private static function getMonthName($number) {
        switch ($number) {
            case 1: return "Jan";
            case 2: return "Fab";
            case 3: return "Mar";
            case 4: return "Apr";
            case 5: return "May";
            case 6: return "Jun";
            case 7: return "Jul";
            case 8: return "Aug";
            case 9: return "Sep";
            case 10: return "Okt";
            case 11: return "Now";
            case 12: return "Dec";
            default: return "";
        }
    }

    public static function getByCategory($categoryId, $skip, $take) {
        return static::where('category_id', $categoryId)->last()->skip($skip)->take($take)->get();
    }



    public function scopeIndexOffer(Builder $query)
    {
        if (Auth::user()->hasPermission('browse_posts')) {
            return $query;
        }
        return $query->where('author_id', '=', Auth::id());
    }

}
