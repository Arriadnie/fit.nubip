
<div class="news-item">
    <a href="{{ route('post', $post->slug) }}" class="news-image">
        <img src="{{ url('storage/' . $post->image) }}" alt="">
    </a>
    <div class="news-info">
        <a href="{{ route('post', $post->slug) }}" class="news-title">{{ $post->title }} </a>

        <div class="news-detail">
            <div class="news-detail-item">
                <svg><use xlink:href="#author"></use></svg>
                <p>{{ isset($post->author) ? $post->author->name : "" }}</p>
            </div>
            <div class="news-detail-item">
                <svg><use xlink:href="#calendar"></use></svg>
                <p>{{ $post->created_at  }}</p>
            </div>
        </div>

        <p class="news-text">
            {!! $post->excerpt !!}
        </p>

        <a href="{{ route('post', $post->slug) }}" class="main-btn light">Читати далі</a>
    </div>
    <div class="date-label">
        <p class="day">02</p>
        <p class="mounth">Feb</p>
    </div>
</div>


