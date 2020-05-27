<?php

namespace App\Http\Controllers\Rating;

use App\Models\Education\Group;
use App\Models\Lookups\Period;
use App\Models\Rating\UserRatingItem;
use Dompdf\Dompdf;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class RatingController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }


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

        return redirect()->route('home.rating.personal')
            ->with([
                'messages' => [
                    [
                        'text' => __('rating.success-create'),
                        'type' => 'success',
                    ]
                ],
                'currentPeriod' => Period::getMonthByDate($dateString),
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

        $redirectRouteName = $request->input('action') == static::PERSONAL_MODE ? 'home.rating.personal' : 'home.rating.starosta';
        return redirect()->route($redirectRouteName)
            ->with([
                'messages' => [
                    [
                        'text' => __('rating.success-edit'),
                        'type' => 'success',
                    ]
                ],
                'currentPeriod' => Period::getMonthByDate($dateString),
            ]);
    }

    public function confirm(Request $request) {
        $id = $request->input('id');
        $item = UserRatingItem::find($id);
        $item->status = UserRatingItem::STATUS_CONFIRMED;
        $item->save();

        $redirectRouteName = $request->input('action') == static::PERSONAL_MODE ? 'home.rating.personal' : 'home.rating.starosta';
        return redirect()->route($redirectRouteName)
            ->with([
                'messages' => [
                    [
                        'text' => __('rating.success-confirm'),
                        'type' => 'success',
                    ]
                ],
                'currentPeriod' => Period::getMonthByDate($item->date),
            ]);
    }

    public function delete(Request $request) {
        $id = $request->input('id');
        $item = UserRatingItem::find($id);
        $date = $item->date;
        $item->delete();

        $redirectRouteName = $request->input('action') == static::PERSONAL_MODE ? 'home.rating.personal' : 'home.rating.starosta';
        return redirect()->route($redirectRouteName)
            ->with([
                'messages' => [
                    [
                        'text' => __('rating.success-delete'),
                        'type' => 'success',
                    ]
                ],
                'currentPeriod' => Period::getMonthByDate($date),
            ]);
    }

    public function reject(Request $request) {
        $id = $request->input('id');
        $item = UserRatingItem::find($id);
        $item->status = UserRatingItem::STATUS_REJECTED;
        $item->comment = $request->input('reject-reason');
        $item->save();

        $redirectRouteName = $request->input('action') == static::PERSONAL_MODE ? 'home.rating.personal' : 'home.rating.starosta';
        return redirect()->route($redirectRouteName)
            ->with([
                'messages' => [
                    [
                        'text' => __('rating.success-reject'),
                        'type' => 'success',
                    ]
                ],
                'currentPeriod' => Period::getMonthByDate($item->date),
            ]);
    }

    public function reportPdf(Request $request) {
        $dompdf = new Dompdf();

        $groupId = $request->input('groupId');
        $periodId = $request->input('periodId');

        $items = $this->_getAllStudents($groupId, $periodId);
        $items = $this->_prepareReportData($groupId, $items);
        $viewResult = view('rating.includes.report-full-table', [
            'items' => $items
        ])->render();

        $dompdf->loadHtml($viewResult);
        $dompdf->
        $dompdf->setPaper('A4', 'landscape');
        $dompdf->render();

        return $dompdf->stream("report.pdf");
    }



    public function service(Request $request)
    {
        if ($request["methodName"] == "getPersonal") {
            $personal = $this->_serviceGetPersonal($request['data']['periodId']);
            $response = response()->json($personal);
        }
        else if ($request["methodName"] == "getReport") {
            $personal = $this->_serviceGetReport($request['data']['groupId'], $request['data']['periodId']);
            $response = response()->json($personal);
        }
        else {
            $response = response()->json(array(), 404);
        }

        return $response;
    }

    private function _serviceGetPersonal($periodId) {
        $items = UserRatingItem::getUserRating($periodId);

        if (count($items) > 0) {
            $viewResult = view('rating.includes.personal-table', [
                'items' => $items
            ])->render();
            $scoreSum = 0.0;
            foreach ($items as $key => $item) {
                if ($item->status == UserRatingItem::STATUS_CONFIRMED) {
                    $scoreSum += $item->ratingItem->score;
                }
            }
        }
        else {
            $viewResult = '';
            $scoreSum = 0;
        }
        return [
            'view' => $viewResult,
            'scoreSum' => $scoreSum
        ];
    }

    private function _serviceGetReport($groupId, $periodId) {
        $items = $this->_getAllStudents($groupId, $periodId);

        if (count($items) > 0) {
            $items = $this->_prepareReportData($groupId, $items);
            $viewResult = view('rating.includes.report-table', [
                'items' => $items
            ])->render();
        }
        else {
            $viewResult = '';
        }
        return [
            'view' => $viewResult
        ];
    }
    private function _getAllStudents($groupId, $periodId) {
        $period = Period::find($periodId);

        return DB::table('users')->select($this->_getColumnsToReport())
            ->leftJoin('user_rating_items', 'users.id', '=', 'user_rating_items.user_id')
            ->leftJoin('rating_items', 'rating_items.id', '=', 'user_rating_items.rating_item_id')
            ->leftJoin('rating_item_groups', 'rating_item_groups.id', '=', 'rating_items.rating_item_group_id')
            ->where(function ($query) use ($period) {
                $query->whereNull('user_rating_items.id')
                    ->orWhereBetween('user_rating_items.date', [$period->start_date, $period->due_date]);
            })
            ->where('users.group_id', '=', $groupId)
            ->orderBy('users.name', 'asc')
            ->orderBy('rating_item_groups.name', 'asc')
            ->orderBy('rating_items.name', 'asc')
            ->orderBy('user_rating_items.date', 'asc')
            ->get();
    }
    private function _getColumnsToReport() {
        return [
            'users.id as user_id',
            'users.name as user_name',
            'user_rating_items.id as user_rating_item_id',
            'user_rating_items.name as user_rating_item_name',
            'user_rating_items.date as user_rating_item_date',
            'rating_items.id as rating_item_id',
            'rating_items.name as rating_item_name',
            'rating_items.score as rating_item_score',
            'rating_item_groups.id as rating_item_group_id',
            'rating_item_groups.name as rating_item_group_name'
        ];
    }

    private function _prepareReportData($groupId, $items) {
        $collection = [];
        $prevUserId = -1;
        $prevPunktId = -1;
        foreach ($items as $key => $value) {
            $collectionItem = [
                'value' => $value,
                'user_count' => 1,
                'punkt_count' => 1,
                'punkt_score' => $value->rating_item_score,
                'user_score' => $value->rating_item_score,
            ];

            if ($prevUserId >= 0 && $collection[$prevUserId]['value']->user_id == $value->user_id) {
                $collection[$prevUserId]['user_count']++;
                $collection[$prevUserId]['user_score'] += $value->rating_item_score;
                $collectionItem['user_count'] = 0;

                if ($collection[$prevPunktId]['value']->rating_item_id == $value->rating_item_id) {
                    $collection[$prevPunktId]['punkt_count']++;
                    $collection[$prevPunktId]['punkt_score'] += $value->rating_item_score;
                    $collectionItem['punkt_count'] = 0;
                } else {
                    $prevPunktId = $key;
                }
            } else {
                $prevUserId = $key;
                $prevPunktId = $key;
            }
            array_push($collection, $collectionItem);
        }
        return $collection;
    }

}
