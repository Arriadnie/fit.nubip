
@foreach($item['programs'] as $program)
    <div class="editor-content" data-id="#{{ $program->slug }}">
        {!! $program->getTranslatedAttribute('info_body') !!}
    </div>
@endforeach
