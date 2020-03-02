<div class="slide-wrap">
    <div class="slide-item">
        <div class="slide-content">
            <p class="slide-heading">{{ $slide->title }}</p>
            <p class="slide-text">
                {{ $slide->body }}
            </p>
            @if($slide->button_link)
            <a href="{{ $slide->button_link }}" class="main-btn">{{ $slide->button_title ? $slide->button_title : 'Дізнатись більше' }}</a>
            @endif
        </div>
        <div class="slide-image">
            <img src="{{ $slide->getImage(true) }}" alt="">
        </div>
    </div>
</div>
