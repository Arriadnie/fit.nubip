<div class="container-main">
    <div class="about-wrap">
        <div class="about-text">
            <p class="lined-title">{{ $infoblock->title }}</p>
            <p class="about-content">
                {!! $infoblock->body !!}
            </p>
            <a href="{{ $infoblock->button_link ? $infoblock->button_link : '#' }}" class="main-btn light">
                {{ $infoblock->button_title }}
            </a>

        </div>
        <div class="about-image">
            <img src="{{ $infoblock->getImage(true) }}" alt="">
        </div>
    </div>
</div>
