
<div class="teacher-info-wrap">
    <div class="teacher-info-image">
        <img src="{{ $people->getImage(true) }}" alt="">
    </div>
    <div class="teacher-info">
        <p class="teacher-status">{{ $people->position }}:</p>
        <p class="teacher-name">{{ $people->getTranslatedAttribute('name') }}</p>
        <p class="teacher-text">{{ strip_tags($people->getTranslatedAttribute('description')) }}</p>
    </div>
</div>

