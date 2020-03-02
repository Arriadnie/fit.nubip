@extends('layouts.app')

@section('title', 'Освітні ступені')

@section('description', '')
@section('body_class', '')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')

    <div style="background: url({{ Voyager::image(setting('pages.default-page-image')) }}) no-repeat center center / cover; background-attachment: fixed;" class="page-header">
        <div class="page-header-overlay"></div>
        <div class="page-header-content">
            <h1>{{ 'Освітні ступені' }}</h1>
        </div>
    </div>

    <div class="editor-wrap">
        <div class="editor-content">

            <div class="courses-list">

                @foreach($degrees as $degree)
                    @include('education.courses-index.item', [
                        'degree' => $degree
                    ])
                @endforeach

            </div>

        </div>
    </div>

@stop

@section('after_content')
@stop

@section('before_scripts')
@stop

@push('scripts')
@endpush

