<a href="#" class="courses-list-item">
    <div class="courses-item-image">
        <div class="overlay"></div>
        <img src="{{ $item->getImage(true) }}" alt="">
    </div>
    <div class="course-item-info">
        <p class="course-item-name">{{ $item->title }}</p>
        @if($item->sub_title)
            <p class="course-item-subtitle">{{ $item->sub_title }}</p>
        @endif
    </div>
</a>
