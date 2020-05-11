<div class="slide-wrap">
    <div class="slide-item">
        <div class="slide-content">
            <p class="slide-heading">{{ $slide->getTranslatedAttribute('title') }}</p>
            <p class="slide-text">
                {{ $slide->getTranslatedAttribute('body') }}
            </p>
            @if($slide->button_link)
            <a href="{{ $slide->button_link }}" class="main-btn">{{ $slide->getTranslatedAttribute('button_title') ? $slide->getTranslatedAttribute('button_title') : __('main.details') }}</a>
            @endif
        </div>
        <div class="slide-image">
            <img src="{{ $slide->getImage(true) }}" alt="">
        </div>
    </div>
</div>
