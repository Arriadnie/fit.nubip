
<div class="course-slide-wrap">
    <div class="course-slide-item">
        <img src="{{ $item->getImage(true) }}" alt="">
        <div class="course-slide-content">
            <p>{{ $item->getTranslatedAttribute('title') }}</p>
        </div>
        @if($item->button_link && $item->getTranslatedAttribute('button_title'))
        <a href="{{ $item->getLink('button_link') }}" class="main-btn white">{{ $item->getTranslatedAttribute('button_title') }}</a>
        @endif
    </div>
</div>
s
