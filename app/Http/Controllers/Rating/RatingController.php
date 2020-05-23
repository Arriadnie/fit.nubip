<?php

namespace App\Http\Controllers\Rating;

use App\Models\Lookups\Period;
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
        $items = UserRatingItem::getStarostaRating();
        return view('rating.starosta', [
            'items' => $items
        ]);
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

        $period = Period::getByDate($dateString);
        $currentPeriod = null;
        if (!is_null($period)) {
            $currentPeriod = [
                'period-type' => $period->period_type_id,
                'period' => $period->id,
            ];
        }

        return redirect()->route('home.rating.personal')
            ->with([
                'messages' => [
                    [
                        'text' => __('rating.success-create'),
                        'type' => 'success',
                    ]
                ],
                'currentPeriod' => $currentPeriod,
            ]);
    }

    const STAROSTA_MODE = "STAROSTA_MODE";
    const PERSONAL_MODE = "PERSONAL_MODE";

    public function edit(Request $request)
    {
        $dateComponents = explode(".", $request->input('date'));
        $dateString = $dateComponents[2] . "-" . $dateComponents[1] . "-" . $dateComponents[0];

        $id = $request->input('id');
        $item = UserRatingItem::find($id);

        if ($request->input('action') == static::PERSONAL_MODE) {
            $item->status = UserRatingItem::STATUS_IN_PROCESS;
        } else {
            $item->status = UserRatingItem::STATUS_EDITED;
        }

        $item->name = $request->input('name');
        $item->date = $dateString;
        $item->rating_item_id = $request->input('punkt');
        $item->name = $request->input('name');

        $item->save();

        return redirect()->route('home.rating.personal')
            ->with([
                'messages' => [
                    [
                        'text' => __('rating.success-edit'),
                        'type' => 'success',
                    ]
                ],
                'currentPeriod' => [
                    'period-type' => $request->input('period-type-input'),
                    'period' => $request->input('period-input'),
                ],
            ]);
    }

    public function confirm(Request $request) {
        $id = $request->input('id');
        $item = UserRatingItem::find($id);
        $item->status = UserRatingItem::STATUS_CONFIRMED;
        $item->save();

        return redirect()->route('home.rating.personal')
            ->with([
                'messages' => [
                    [
                        'text' => __('rating.success-confirm'),
                        'type' => 'success',
                    ]
                ],
                'currentPeriod' => [
                    'period-type' => $request->input('period-type-input'),
                    'period' => $request->input('period-input'),
                ],
            ]);
    }

    public function delete(Request $request) {
        $id = $request->input('id');
        $item = UserRatingItem::find($id);
        $item->delete();

        return redirect()->route('home.rating.personal')
            ->with([
                'messages' => [
                    [
                        'text' => __('rating.success-delete'),
                        'type' => 'success',
                    ]
                ],
                'currentPeriod' => [
                    'period-type' => $request->input('period-type-input'),
                    'period' => $request->input('period-input'),
                ],
            ]);
    }

    public function reject(Request $request) {
        $id = $request->input('id');
        $item = UserRatingItem::find($id);
        $item->status = UserRatingItem::STATUS_REJECTED;
        $item->save();

        return redirect()->route('home.rating.personal')
            ->with([
                'messages' => [
                    [
                        'text' => __('rating.success-reject'),
                        'type' => 'success',
                    ]
                ],
                'currentPeriod' => [
                    'period-type' => $request->input('period-type-input'),
                    'period' => $request->input('period-input'),
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
