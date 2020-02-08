@extends('layouts.app')

@section('title', setting('site.title'))

@section('description', '')
@section('body_class', 'courses-page')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')

    <div style="background: url({{ asset('/image/students.jpg') }}) no-repeat center center / cover; background-attachment: fixed;" class="page-header">
        {{--        <img src="{{  }}" alt="">--}}
        <div class="page-header-overlay"></div>
        <div class="page-header-content">
            <h1>Кафедри факультету</h1>
        </div>
    </div>

    <div class="container-250">
        <div class="department-list">
            @for($i = 0; $i < 4; $i++)
                <div class="department-item">
                    <img src="{{ asset('/image/department1.jpg') }}" alt="">
                    <div class="department-name">
                        <p>Кафедра інформаційних і дистанційних технологій</p>
                    </div>
                </div>
            @endfor

        </div>
    </div>


@stop

@section('after_content')
@stop

@section('before_scripts')
@stop

@push('scripts')
@endpush
