
<li>
    @foreach($item['programs'] as $program)
        <li>
            <strong>{{ $program->name }}</strong>
            {!! $program->info_body !!}
        </li>
    @endforeach
</li>
