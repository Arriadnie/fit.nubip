@extends('layouts.app')

@section('title', 'Posts')

@section('content-title', 'Posts')

@section('content')
    <div class="posts">
        @foreach($posts as $post)
            <div class="post">
                @include('posts.postCard', [
                    'post' => $post
                ])
            </div>
        @endforeach
    </div>
@endsection
