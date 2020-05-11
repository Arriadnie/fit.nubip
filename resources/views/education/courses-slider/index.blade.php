<div class="container-main">
    <div class="courses-home">
        <div class="block-title">
            <p class="block-heading">{{ Setting::getLocalized('main-page.courses-slider-title') }}</p>
            <p class="block-subtitle">{{ Setting::getLocalized('main-page.courses-slider-subtitle') }}</p>
            <div class="block-title-decor">
                <div class="line left"></div>
                <div class="block-title-icon">
                    <svg><use xlink:href="#cup"></use></svg>
                </div>
                <div class="line right"></div>
            </div>
        </div>

        <div class="courses-home-list">
            @foreach(App\Models\Education\EducationProgram::getForMainSlider() as $program)
                @include('education.courses-slider.item', [
                    'program' => $program
                ])
            @endforeach
        </div>
        <a href="{{ url('/education/courses') }}" class="main-btn">@lang('education.show-all-courses')</a>
    </div>
</div>
