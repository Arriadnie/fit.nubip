

@php($period = Session::get('currentPeriod'))

@if(isset($period) && !is_null($period))
    <script>
        window.rating = window.rating || {};
        window.rating.periodFilter = {
            'period-type': {{ $period->period_type_id }},
            'period': {{ $period->id }}
        };
    </script>

@endif


