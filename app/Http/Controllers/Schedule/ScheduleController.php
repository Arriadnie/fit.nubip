<?php

namespace App\Http\Controllers\Schedule;

use App\Models\Lookups\Period;
use App\Models\Schedule\Lesson;
use App\Models\Schedule\Lookups\Day;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class ScheduleController extends Controller
{

    public function index()
    {
        return view('schedule.index', [

        ]);
    }


    public function service(Request $request)
    {
        if ($request["methodName"] == "getSchedule") {
            $schedule = $this->getGroupSchedule($request['data']['groupId']);
            $response = response()->json($schedule);
        }
        else {
            $response = response()->json(array(), 404);
        }

        return $response;
    }

    public function getGroupSchedule($groupId) {
        $lessons = $this->_getGroupSchedule($groupId);

        $lessonsGrid = [];
        $maxPosition = 0;
        $maxDayOrder = Day::count();
        foreach ($lessons as $key => $lesson) {
            $lessonsGrid[$lesson->lesson_position . '_' . $lesson->day_order . '_' . $lesson->lesson_frequency] = $lesson;

            if ($lesson->lesson_position > $maxPosition) {
                $maxPosition = $lesson->lesson_position;
            }
        }

        $view1 = view('schedule.includes.grid', [
            'lessonsGrid' => $lessonsGrid,
            'maxPosition' => $maxPosition,
            'maxDayOrder' => $maxDayOrder,
            'frequency1' => Lesson::FREQUENCY_FULL,
            'frequency2' => Lesson::FREQUENCY_NUMERATOR,
        ])->render();
        $view2 = view('schedule.includes.grid', [
            'lessonsGrid' => $lessonsGrid,
            'maxPosition' => $maxPosition,
            'maxDayOrder' => $maxDayOrder,
            'frequency1' => Lesson::FREQUENCY_FULL,
            'frequency2' => Lesson::FREQUENCY_DENOMINATOR,
        ])->render();
        return [
            'view1' => $view1,
            'view2' => $view2,
        ];
    }
    private function _getGroupSchedule($groupId) {
        $nowDate = Carbon::now();

        return DB::table('lessons')->select($this->_getColumnsToSchedule())
            ->leftJoin('days', 'days.id', '=', 'lessons.day_id')
            ->leftJoin('disciplines', 'disciplines.id', '=', 'lessons.discipline_id')
            ->leftJoin('audiences', 'audiences.id', '=', 'lessons.audience_id')
            ->leftJoin('buildings', 'buildings.id', '=', 'audiences.building_id')
            ->leftJoin('periods', 'periods.id', '=', 'lessons.period_id')
            ->leftJoin('group_in_lessons', 'group_in_lessons.lesson_id', '=', 'lessons.id')
            ->where(function ($query) use ($nowDate) {
                $query->where('periods.start_date', '<=', $nowDate)
                    ->where('periods.due_date', '>=', $nowDate);
            })
            ->where('group_in_lessons.group_id', '=', $groupId)
            ->orderBy('lessons.position', 'asc')
            ->orderBy('days.order', 'asc')
            ->get();
    }
    private function _getColumnsToSchedule() {
        return [
            'lessons.position as lesson_position',
            'lessons.frequency as lesson_frequency',
            'lessons.lesson_type_id as lesson_type_id',
            'days.order as day_order',
            'disciplines.name as discipline_name',
            'audiences.number as audience_number',
            'buildings.number as building_number'
        ];
    }

}
