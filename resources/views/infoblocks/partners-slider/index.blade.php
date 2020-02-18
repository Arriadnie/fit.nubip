<div class="container-main">
    <div class="course-slider-wrap">
        <div class="block-title">
            <p class="block-heading">{{ $infoblock->title }}</p>

            <div class="block-title-decor">
                <div class="line left"></div>
                <div class="block-title-icon">
                    <svg><use xlink:href="#cup"></use></svg>
                </div>
                <div class="line right"></div>
            </div>
        </div>

        <div class="partners-slider inner-slider default">
            @foreach($infoblock->items as $item)
                @include('infoblocks/partners-slider/item', [
                    'item' => $item
                ])
            @endforeach
        </div>
    </div>
</div>
