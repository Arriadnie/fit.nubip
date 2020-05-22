<?php

namespace App\Http\Controllers\Rating;

use App\Models\Rating\UserRatingItem;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class RatingController extends Controller
{

    public function entering()
    {
        return view('rating.entering');
    }

    public function personal()
    {
        return view('rating.personal');
    }

    public function starosta()
    {
        return view('rating.starosta');
    }

    public function report()
    {
        return view('rating.report');
    }



    public function createPersonal(Request $request)
    {
        $dateComponents = explode(".", $request->input('date'));
        $dateString = $dateComponents[2] . "-" . $dateComponents[1] . "-" . $dateComponents[0];
        UserRatingItem::create([
            'name' => $request->input('name'),
            'date' => $dateString,
            'rating_item_id' => $request->input('punkt'),
            'user_id' => Auth::id(),
        ]);
        return redirect()->route('home.rating.personal')
            ->with([
                'messages' => [
                    [
                        'text' => __('rating.success-create'),
                        'type' => 'success',
                    ]
                ],
            ]);
    }

    public function service(Request $request)
    {
        if ($request["methodName"] == "getPersonal") {
            $items = UserRatingItem::getUserRating($request['data']['periodId']);

            if (count($items) > 0) {
                $viewResult = view('rating.includes.personal-table', [
                    'items' => $items
                ])->render();
            }
            else {
                $viewResult = '';
            }
            $response = response()->json([
                'view' => $viewResult
            ]);
        }
        else {
            $response = response()->json(array(), 404);
        }

        return $response;
    }
}