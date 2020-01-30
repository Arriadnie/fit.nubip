
<h1><a href="{{ route('post', $post->slug) }}">{{ $post->title }}</a></h1>
<h4>{{ isset($post->author) ? $post->author->name : "" }}</h4>
<h4>{{ isset($post->category) ? $post->category->name : "" }}</h4>
<div class="content">
    {!! $post->excerpt !!}
</div>

