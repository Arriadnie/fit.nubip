<div class="container-main">
    <div class="course-slider-wrap">
        <div class="block-title">
            <p class="block-heading">Кафедри факультету</p>
            <p class="block-subtitle">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias animi dolorum inve</p>
            <div class="block-title-decor">
                <div class="line left"></div>
                <div class="block-title-icon">
                    <svg><use xlink:href="#cup"></use></svg>
                </div>
                <div class="line right"></div>
            </div>
        </div>

        <div class="course-slider inner-slider default">
            @for($i = 0; $i < 6; $i++)
{{--                @foreach($infoblock->items as $item)--}}
                    <div class="course-slide-wrap">
                        <div class="course-slide-item">
                            <img src="{{ asset('/image/department1.jpg') }}" alt="">
                            <div class="course-slide-content">
                                <p>Комп'ютерних наук</p>
                            </div>
                            <a href="#" class="main-btn white">Детальнійше</a>
                        </div>
                    </div>
{{--                @endforeach--}}
            @endfor
        </div>
        <a href="#" class="main-btn">Переглянути всі кафедри</a>
    </div>
</div>
