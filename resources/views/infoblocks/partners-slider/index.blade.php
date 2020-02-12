<div class="container-main">
    <div class="course-slider-wrap">
        <div class="block-title">
            <p class="block-heading">Партнери</p>

            <div class="block-title-decor">
                <div class="line left"></div>
                <div class="block-title-icon">
                    <svg><use xlink:href="#cup"></use></svg>
                </div>
                <div class="line right"></div>
            </div>
        </div>

        <div class="partners-slider inner-slider default">

            @for($i = 1; $i < 5; $i++)
                <div class="slide-wrap">
                    <div class="slide-item">
                        <img src="{{ asset('/image/partner' . $i . '.png') }}" alt="">
                    </div>
                </div>
            @endfor
                @for($i = 1; $i < 5; $i++)
                    <div class="slide-wrap">
                        <div class="slide-item">
                            <img src="{{ asset('/image/partner' . $i . '.png') }}" alt="">
                        </div>
                    </div>
                @endfor
        </div>
    </div>
</div>
