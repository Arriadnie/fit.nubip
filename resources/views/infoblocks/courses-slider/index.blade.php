<div class="container-main">
    <div class="course-slider-wrap">
        <div class="block-title">
            <p class="block-heading">{{ $infoblock->title }}</p>
            <p class="block-subtitle">{{ $infoblock->sub_title }}</p>
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
                @foreach($infoblock->items as $item)
                    @include('infoblocks/courses-slider/item', [
                        'item' => $item
                    ])
                @endforeach
            @endfor
        </div>
        <a href="{{ $infoblock->getLink('button_link') }}" class="main-btn">{{ $infoblock->button_title }}</a>
    </div>
</div>
