

@php($period = Session::get('currentPeriod'))

@if(isset($period) && !is_null($period) && !is_null($period['period-type']) && !is_null($period['period']))
    <script>
        window.rating = window.rating || {};
        window.rating.periodFilter = {
            'period-type': {{ $period['period-type'] }},
            'period': {{ $period['period'] }}
        };
    </script>

@endif


