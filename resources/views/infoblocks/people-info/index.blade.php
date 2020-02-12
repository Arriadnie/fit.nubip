<div class="teacher-info-wrap">
    <div class="teacher-info-image">
        <img src="{{ $infoblock->getImage(true) }}" alt="">
    </div>
    <div class="teacher-info">
        <p class="teacher-status">{{ $infoblock->sub_title }}:</p>
        <p class="teacher-name">{{ $infoblock->title }}</p>
        <p class="teacher-text">{{ strip_tags($infoblock->body) }}</p>
    </div>
</div>
