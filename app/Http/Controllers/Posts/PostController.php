<?php

namespace App\Http\Controllers\Posts;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use App\Models\Posts\Category;
use App\Models\Posts\Post;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\VoyagerBaseController;

class PostController extends VoyagerBaseController
{
    public function offerCreate(Request $request)
    {
        $slug = 'posts';

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('offer', app($dataType->model_name));

        $dataTypeContent = (strlen($dataType->model_name) != 0)
            ? new $dataType->model_name()
            : false;

        foreach ($dataType->addRows as $key => $row) {
            $dataType->addRows[$key]['col_width'] = $row->details->width ?? 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'add');

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }
        $isOffer = true;
        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable', 'isOffer'));
    }
    public function offerStore(Request $request)
    {
        $slug = 'posts';

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('offer', app($dataType->model_name));

        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->addRows)->validate();
        $request->request->set('status', Post::STATUS_PENDING);
        //dd($request);
        $data = $this->insertUpdateData($request, $slug, $dataType->addRows, new $dataType->model_name());

        event(new BreadDataAdded($dataType, $data));
        return redirect()->route('home.index')
            ->with([
                'messages' => [
                    [
                        'text' => __('posts.offer-success'),
                        'type' => 'success',
                    ]
                ],
            ]);
    }


    const PAGINATE_COUNT = 6;

    public function publicShow($slug) {
        return view('posts.show', [
            'post' => Post::where('slug', '=', $slug)->firstOrFail()
        ]);
    }
    public function publicIndex() {
        $categories = Category::all();

        return view('posts.index', [
            'categories' => $categories,
            'posts' => Post::last(static::PAGINATE_COUNT)->published()->get()
        ]);
    }

    public function postService(Request $request) {
        if ($request["methodName"] == "getPostByCategory") {
            $posts = static::getPosts($request['data']);

            if (count($posts) > 0) {
                $viewResult = view('posts.includes.card-collection', [
                    'posts' => $posts
                ])->render();
                $existsMore = static:: existsMorePost($request['data']  );
            }
            else {
                $viewResult = '';
                $existsMore = false;
            }
            $response = response()->json([
                'view' => $viewResult,
                'existsMore' => $existsMore
            ]);
        }
        else {
            $response = response()->json(array(), 404);
        }

        return $response;
    }


    private static function getPosts($config) {
        $categoryId = $config['categoryId'];
        $skip = $config['pageNumber'] * static::PAGINATE_COUNT;
        return $categoryId == 0 ?
            Post::last()->skip($skip)->take(static::PAGINATE_COUNT)->get() :
            Post::getByCategory($categoryId, $skip, static::PAGINATE_COUNT);
    }
    private static function existsMorePost($config) {
        $categoryId = $config['categoryId'];
        $skip = ($config['pageNumber'] + 1) * 6;
        return count($categoryId == 0 ?
            Post::last()->skip($skip)->take(1)->get() :
            Post::getByCategory($categoryId, $skip, 1)) > 0;
    }
}
