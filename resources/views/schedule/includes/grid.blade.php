


@for($position = 1; $position <= $maxPosition; $position++)
    <tr>
        <th>{{ $position }}</th>
        @for($dayOrder = 1; $dayOrder <= $maxDayOrder; $dayOrder++)
            <td>
                @if(isset($lessonsGrid[$position . '_' . $dayOrder . '_' . $frequency1]) || isset($lessonsGrid[$position . '_' . $dayOrder . '_' . $frequency2]))
                    @php($lesson = isset($lessonsGrid[$position . '_' . $dayOrder . '_' . $frequency1]) ?
                        $lessonsGrid[$position . '_' . $dayOrder . '_' . $frequency1] :
                        $lessonsGrid[$position . '_' . $dayOrder . '_' . $frequency2])
                    <div class="schedule-item">
                        <div class="schedule-icon {{ $lesson->lesson_type_id == 1 ? 'lecture' : 'practice' }}">
                            {{ $lesson->lesson_type_id == 1 ? 'L' : 'P' }}
                        </div>
                        {{ $lesson->discipline_name }}, {{ $lesson->audience_number }}, к {{ $lesson->building_number }}
                    </div>
                @endif
            </td>
        @endfor
    </tr>
@endfor
