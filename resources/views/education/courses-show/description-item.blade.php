
@foreach($item['programs'] as $program)
    <div class="editor-content" data-id="#{{ $program->slug }}">
        {!! $program->info_body !!}
    </div>
@endforeach
