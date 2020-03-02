
<div class="course-slide-wrap">
    <div class="course-slide-item">
        <img src="{{ $program->getImage(true) }}" alt="">
        <div class="course-slide-content">
            <p>{{ $program->name }}</p>
        </div>
        <a href="{{ url('/education/courses/' . $program->degree->slug . '#' . $program->slug) }}" class="main-btn white">Детальніше</a>
    </div>
</div>
