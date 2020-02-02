@extends('layouts.app')

@section('title', $post->title)

@section('content-title', $post->title)

@section('content')
    @if (session('status'))
        <div class="alert alert-success" role="alert">
            {{ session('status') }}
        </div>
    @endif
    New

    <h1>{{ $post->title }}</h1>
    <h4>{{ isset($post->author) ? $post->author->name : "" }}</h4>
    <h4>{{ isset($post->category) ? $post->category->name : "" }}</h4>
    <div class="content">
        {!! $post->body !!}
    </div>
@endsection
