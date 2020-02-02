<?php

namespace App\Http\Controllers\Posts;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Posts\Category;
use App\Models\Posts\Post;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Facades\Voyager;

class PostController extends \TCG\Voyager\Http\Controllers\VoyagerBaseController
{
    public function update(Request $request, $id)
    {
        $result = parent::update($request, $id);

        $post = Post::find($id);
        $this->syncCategories($post, $request->input('categories'));

        return $result;
    }
    public function store(Request $request)
    {
        $result = parent::store($request);

        $slug = $this->getSlug($request);
        $post = Post::where('slug', '=', $slug)->first();
        $this->syncCategories($post, $request->input('categories'));

        return $result;
    }
    private function syncCategories($post, $categories) {
        if ($categories) {
            $post->categories()->sync($categories);
        }
    }





    public function publicShow($slug) {
        return view('posts/show', [
            'post' => Post::with('categories')->where('slug', '=', $slug)->firstOrFail()
        ]);
    }
    public function publicIndex() {
        $categories = Category::all();

        return view('posts/index', [
            'categories' => $categories,
            'posts' => Post::all()
        ]);
    }
}
