@extends('layouts.app')

@section('title', Setting::getLocalized('pages.our-students-page-title'))

@section('description', '')
@section('body_class', '')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')

<div style="background: url({{ Setting::getImage('pages.default-page-image') }}) no-repeat center center / cover; background-attachment: fixed;" class="page-header">
    <div class="page-header-overlay"></div>
    <div class="page-header-content">
        <h1>{{ Setting::getLocalized('pages.our-students-page-title') }}</h1>
    </div>
</div>

<div class="editor-wrap">
    <div class="editor-content">
        [people-info-group code="vipuskniki"]
    </div>
</div>

@stop

@section('after_content')
@stop

@section('before_scripts')
@stop

@push('scripts')
@endpush
