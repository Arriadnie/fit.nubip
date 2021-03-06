@extends('layouts.app')

@section('title', $post->title)

@section('content-title', $post->title)

@section('content')
    @if (session('status'))
        <div class="alert alert-success" role="alert">
            {{ session('status') }}
        </div>
    @endif

    <div style="background: url({{ $post->getImage(true) }}) no-repeat center center / cover; background-attachment: fixed;" class="page-header">
        <div class="page-header-overlay"></div>
        <div class="page-header-content">
            <h1>{{ $post->getTranslatedAttribute('title') }}</h1>
        </div>
    </div>

    <div class="editor-wrap">
        <div class="post-info">
            <div class="post-date">
                <svg><use xlink:href="#calendar"></use></svg>
                <p>{{ $post->created_at->format('d-m-Y') }}</p>
            </div>
            <div class="post-author">
                <p>{{ isset($post->author) ? $post->author->name : "" }}</p>
                <div class="author-image">

                    <img src=" {{ Storage::disk(config('voyager.storage.disk'))->url(str_replace('\\', '/', $post->author->avatar )) }} " alt="">
                </div>

            </div>
        </div>

        <div class="editor-content">
            {!! $post->getTranslatedAttribute('body') !!}
        </div>

        <div class="share-post">
            @foreach(App\Models\SocialNetwork::all() as $network)
                <a href="{{ $network->link }}" target="_blank">
                    <img src="{{ $network->getImage(true) }}" alt="">
                </a>
            @endforeach
        </div>
    </div>






@endsection
