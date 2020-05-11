
<div class="accordion-item">
    @if(count($item['programs']) > 1)
        <div class="accordion-title closed" data-toggle-btn="{{ $item['specialty']->slug }}">
            <a href="#">{{ $item['specialty']->getTranslatedAttribute('name') }}</a>
        </div>

        <div class="accordion-body" data-toggle-block="{{ $item['specialty']->slug }}">
            @foreach($item['programs'] as $program)
                <a data-href="#{{ $program->slug }}" href="#{{ $program->slug }}">{{ $program->getTranslatedAttribute('name') }}</a>
            @endforeach
        </div>
    @else
        <div class="accordion-title">
            <a data-href="#{{ $item['programs'][0]->slug }}" href="#{{ $item['programs'][0]->slug }}">{{ $item['programs'][0]->getTranslatedAttribute('name') }}</a>
        </div>
    @endif
</div>

