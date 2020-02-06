@extends('layouts.app')

@section('title', setting('site.title'))

@section('description', '')
@section('body_class', 'home-page')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')
    @include('infoblocks.slider.index', [
        'infoblock' => App\Models\Infoblocks\Infoblock::findBySlug('slider-main')
    ])

    @include('infoblocks.about.index')

    @include('infoblocks.courses-slider.index')

    @include('infoblocks.statistic.index')

    @include('posts.preview', [
        'posts' => App\Models\Posts\Post::getPostsForMainPage()
    ])

    @include('infoblocks.students.index')


@stop

@section('after_content')
@stop

@section('before_scripts')
@stop

@push('scripts')
@endpush
