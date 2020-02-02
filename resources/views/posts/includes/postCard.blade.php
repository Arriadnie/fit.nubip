
<div class="news-item">
    <a href="{{ route('post', $post->slug) }}" class="news-image">
        <img src="{{ Storage::disk(config('voyager.storage.disk'))->url($post->image) }}" alt="">
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
                <p>{{ $post->created_at->format('d-m-Y') }}</p>
{{--                $post->created_at->format('Y-m-d H:i:s')--}}
            </div>
        </div>

        <p class="news-text">
            {!! $post->excerpt !!}
        </p>

        <a href="{{ route('post', $post->slug) }}" class="main-btn light">Читати далі</a>
    </div>
    <div class="date-label">
        <p class="day">{{ $post->created_at->format('d') }}</p>
        <p class="mounth">{{ App\Models\Posts\Post::getPostDateMonth($post->created_at) }}</p>
    </div>
</div>


