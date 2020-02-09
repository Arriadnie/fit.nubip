
<div class="course-slide-wrap">
    <div class="course-slide-item">
        <img src="{{ $item->getImage(true) }}" alt="">
        <div class="course-slide-content">
            <p>{{ $item->title }}</p>
        </div>
        <a href="{{ $item->getLink('button_link') }}" class="main-btn white">{{ $item->button_title }}</a>
    </div>
</div>
