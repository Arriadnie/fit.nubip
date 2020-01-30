
<div class="news-slider-wrap">
    <div class="block-title">
        <p class="block-heading">Новини та події</p>
        <p class="block-subtitle">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod </p>
        <div class="block-title-decor">
            <div class="line left"></div>
            <div class="block-title-icon">
                <svg><use xlink:href="#cup"></use></svg>
            </div>
            <div class="line right"></div>
        </div>
    </div>
    <div class="news-wrapper">
        @for($i = 0; $i < 3; $i++)
            @include('posts.postCard', ['post' => $posts[$i]])
        @endfor
    </div>
</div>
