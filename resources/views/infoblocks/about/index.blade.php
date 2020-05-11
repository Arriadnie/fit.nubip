<div class="container-main">
    <div class="about-wrap">
        <div class="about-text">
            <p class="lined-title">{{ $infoblock->getTranslatedAttribute('title') }}</p>
            <div class="about-content">
                {!! $infoblock->getTranslatedAttribute('body') !!}
            </div>
            <a href="{{ $infoblock->button_link ? $infoblock->button_link : '#' }}" class="main-btn light">
                {{ $infoblock->getTranslatedAttribute('button_title') }}
            </a>

        </div>
        <div class="about-image">
            <img src="{{ $infoblock->getImage(true) }}" alt="">
        </div>
    </div>
</div>
