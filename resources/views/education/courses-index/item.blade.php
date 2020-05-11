
<a href="{{ url('/education/courses/' . $degree->slug) }}" class="courses-list-item">
    <div class="courses-item-image">
        <div class="overlay"></div>
        <img src="{{ $degree->getImage(true) }}" alt="">
    </div>
    <div class="course-item-info">
        <p class="course-item-name">{{ $degree->getTranslatedAttribute('name') }}</p>
        @if($degree->getTranslatedAttribute('description'))
            <p class="course-item-subtitle">{{ $item->getTranslatedAttribute('description') }}</p>
        @endif
    </div>
</a>
