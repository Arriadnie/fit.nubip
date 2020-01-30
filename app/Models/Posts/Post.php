<?php

namespace App\Models\Posts;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;

class Post extends \TCG\Voyager\Models\Post
{
    public function save(array $options = [])
    {
        parent::save();
    }

    public function categories()
    {
        return $this->belongsToMany(Voyager::modelClass('Category'));
    }

    public function author()
    {
        return parent::authorId();
    }

    public function scopeLast(Builder $query, int $count)
    {
        $result = $query->orderBy('created_at', 'desc');
        if ($count > 0) {
            $result = $result->take($count);
        }
        return $result;
    }

    public static function getPostsForMainPage() {
        $count = setting('site.newsCountOnHomePage');
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

}
