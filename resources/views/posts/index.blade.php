@extends('layouts.app')

@section('title', 'Posts')

@section('content-title', 'Posts')

@section('content')
    <div style="background: url({{ Storage::disk(config('voyager.storage.disk'))->url(str_replace('\\', '/', setting('posts.page-header-image'))) }}) no-repeat center center / cover; background-attachment: fixed;" class="page-header">
{{--        <img src="{{  }}" alt="">--}}
        <div class="page-header-overlay"></div>
        <div class="page-header-content">
            <h1>Новини</h1>
        </div>
    </div>

    @foreach($categories as $category)
        {{ $category->id . ';' . $category->slug . ';' . $category->name }}
    @endforeach


    <div class="news-container">

        <div class="news-wrapper">
            @foreach($posts as $post)
                @include('posts.includes.postCard', ['post' => $post])
            @endforeach
        </div>
    </div>

@endsection
