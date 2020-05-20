
@php($periodTypes = PeriodType::with('periods')->get())

<script>
    window.periods = {
        @foreach($periodTypes as $periodType)
        "period-type-{{ $periodType->id }}":
            [
                @foreach($periodType->periods as $period)
                {
                    "text": "{{ $period->name }}",
                    "value": "{{ $period->id }}"
                },
                @endforeach
            ],
        @endforeach
    }

</script>
