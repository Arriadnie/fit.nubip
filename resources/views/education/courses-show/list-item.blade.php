
<li>
    @if(count($item['programs']) > 1)
        {{ $item['specialty']->name }}
        <ul>
            @foreach($item['programs'] as $program)
                <li>{{ $program->name }}</li>
            @endforeach
        </ul>
    @else
        {{ $item['programs'][0]->name }}
    @endif
</li>
