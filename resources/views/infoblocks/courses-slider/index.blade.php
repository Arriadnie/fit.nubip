<div class="container-main">
    <div class="course-slider-wrap">
        <div class="block-title">
            <p class="block-heading">Навчальні програми</p>
            <p class="block-subtitle">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod </p>
            <div class="block-title-decor">
                <div class="line left"></div>
                <div class="block-title-icon">
                    <svg><use xlink:href="#cup"></use></svg>
                </div>
                <div class="line right"></div>
            </div>
        </div>

        <div class="course-slider inner-slider">

                @for($i = 0; $i < 2; $i++)
                <div class="course-slide-wrap">
                    <div class="course-slide-item">
                        <img src="{{ asset('/image/course1.jpg') }}" alt="">
                        <div class="course-slide-content">
                            <p>Комп'ютерні науки</p>
                        </div>
                        <a href="#" class="main-btn white">Детільніше</a>
                    </div>
                </div>
                <div class="course-slide-wrap">
                    <div class="course-slide-item">
                        <img src="{{ asset('/image/course2.jpg') }}" alt="">
                        <div class="course-slide-content">
                            <p>Комп'ютерна інженерія</p>
                        </div>
                        <a href="#" class="main-btn white">Детільніше</a>
                    </div>
                </div>
                <div class="course-slide-wrap">
                    <div class="course-slide-item">
                        <img src="{{ asset('/image/course3.jpg') }}" alt="">
                        <div class="course-slide-content">
                            <p>Економічна кібернетика</p>
                        </div>
                        <a href="#" class="main-btn white">Детільніше</a>
                    </div>
                </div>
                @endfor
            </div>

        <a href="#" class="main-btn">Переглянути всі курси</a>

        </div>

    </div>
</div>
