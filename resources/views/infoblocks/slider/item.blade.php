<div class="slide-wrap">
    <div class="slide-item">
        <div class="slide-content">
            <p class="slide-heading">{{ $slide->title }}</p>
            <p class="slide-text">
                {{ $slide->body }}
            </p>
            <a href="{{ $slide->button_link }}" class="main-btn">{{ $slide->button_title }}</a>
        </div>
        <div class="slide-image">
            <img src="{{ url('storage\\' . $slide->image) }}" alt="">
        </div>
    </div>
</div>
