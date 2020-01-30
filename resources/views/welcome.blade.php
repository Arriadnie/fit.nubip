@extends('layouts.app')

@section('title', setting('site.title'))

@section('description', '')
@section('body_class', 'home-page')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')
    @include('infoblocks.slider.index', [
        'infoblock' => App\Models\Infoblocks\Infoblock::findBySlug('')
    ])
@stop

@section('after_content')
@stop

@section('before_scripts')
@stop

@push('scripts')
@endpush
