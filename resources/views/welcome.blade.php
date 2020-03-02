@extends('layouts.app')

@section('title', setting('site.title'))

@section('description', '')
@section('body_class', 'home-page')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')

    [infoblock code="slider-main"]

    [infoblock code="dekil-ka-sliv-pro-nas"]

    [infoblock code="shvidkij-dostup"]

    @include('education.courses-slider.index')

    [infoblock code="statistika-golovna"]

    @include('posts.preview')

    @include('infoblocks.students.index')


@stop

@section('after_content')
@stop

@section('before_scripts')
@stop

@push('scripts')
@endpush
