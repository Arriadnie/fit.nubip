<div class="news-item">
    <a href="{{ route('post', $post->slug) }}" class="news-image">
        <img src="{{ $post->getImage(true) }}" alt="">
    </a>
    <div class="news-info">
        <a href="{{ route('post', $post->slug) }}" class="news-title">{{ $post->getTranslatedAttribute('title') }} </a>

        <div class="news-detail">
            <div class="news-detail-item">
                <svg><use xlink:href="#author"></use></svg>
                <p>{{ isset($post->author) ? $post->author->name : "" }}</p>
            </div>
            <div class="news-detail-item">
                <svg><use xlink:href="#calendar"></use></svg>
                <p>{{ $post->created_at->format('d-m-Y') }}</p>
            </div>
        </div>

        <p class="news-text">
            {!! $post->getTranslatedAttribute('excerpt') !!}
        </p>

        <a href="{{ route('post', $post->slug) }}" class="main-btn light">@lang('main.read-more')</a>
    </div>
    <div class="date-label">
        <p class="day">{{ $post->created_at->format('d') }}</p>
        <p class="mounth">{{ $post->getPostDateMonth() }}</p>
    </div>
</div>



