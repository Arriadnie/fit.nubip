
<div class="teacher-info-wrap">
    <div class="teacher-info-image">
        <img src="{{ $infoblock->getImage(true) }}" alt="">
    </div>
    <div class="teacher-info">
        <p class="teacher-status">{{ $infoblock->position }}:</p>
        <p class="teacher-name">{{ $infoblock->name }}</p>
        <p class="teacher-text">{{ strip_tags($infoblock->description) }}</p>
    </div>
</div>

