
<div class="container-main">
    <div class="block-title">
        <p class="block-heading">{{ setting('posts.preview-title') }}</p>
        <p class="block-subtitle">{{ setting('posts.preview-subtitle') }}</p>
        <div class="block-title-decor">
            <div class="line left"></div>
            <div class="block-title-icon">
                <svg><use xlink:href="#cup"></use></svg>
            </div>
            <div class="line right"></div>
        </div>
    </div>
    <div class="news-wrapper">
        @include('posts.includes.card-collection', ['posts' => App\Models\Posts\Post::getPostsForMainPage()])
    </div>
</div>
