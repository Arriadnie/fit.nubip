<div class="container-main">
    <div class="course-slider-wrap">
        <div class="block-title">
            <p class="block-heading">{{ setting('main-page.courses-slider-title') }}</p>
            <p class="block-subtitle">{{ setting('main-page.courses-slider-subtitle') }}</p>
            <div class="block-title-decor">
                <div class="line left"></div>
                <div class="block-title-icon">
                    <svg><use xlink:href="#cup"></use></svg>
                </div>
                <div class="line right"></div>
            </div>
        </div>

        <div class="course-slider inner-slider">
            @foreach(App\Models\Education\EducationProgram::getForMainSlider() as $program)
                @include('education.courses-slider.item', [
                    'program' => $program
                ])
            @endforeach
        </div>
        <a href="{{ url('/education/courses') }}" class="main-btn">Переглянути всі курси</a>
    </div>
</div>
