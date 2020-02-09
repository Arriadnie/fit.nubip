<div class="gallery-wrap">
    <div class="block-title">
        <p class="block-heading">Галерея</p>
       <div class="block-title-decor">
            <div class="line left"></div>
            <div class="block-title-icon">
                <svg><use xlink:href="#cup"></use></svg>
            </div>
            <div class="line right"></div>
        </div>
    </div>

    <div class="gallery">
        @for($i = 1; $i < 4; $i++ )
            <div class="gallery-item">
                <img src="{{ asset('/image/slide'. $i.'.jpg') }}" alt="">
            </div>
        @endfor
    </div>

</div>
