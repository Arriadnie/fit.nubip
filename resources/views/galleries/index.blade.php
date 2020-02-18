<div class="gallery-wrap">
    <div class="block-title">
        <p class="block-heading">{{ $gallery->title }}</p>
       <div class="block-title-decor">
            <div class="line left"></div>
            <div class="block-title-icon">
                <svg><use xlink:href="#cup"></use></svg>
            </div>
            <div class="line right"></div>
        </div>
    </div>

    <div class="gallery">
        @foreach($gallery->images as $image)
            @include('galleries/item', [
                'image' => $image
            ])
        @endforeach
    </div>

</div>
