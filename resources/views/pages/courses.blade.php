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
            <h1>Навчальні програми</h1>
        </div>
    </div>

    <div class="container-300">
        <div class="courses-list">

            @for($i = 0; $i < 5; $i++)

                <a href="#" class="courses-list-item">
                    <div class="courses-item-image">
                        <div class="overlay"></div>
                        <img src="{{ asset('/image/course1.jpg') }}" alt="">
                    </div>
                    <div class="course-item-info">
                        <p class="course-item-name">122 Комп'ютерні науки</p>
                        <p class="course-item-subtitle">Фахівець з інформаційних технологій</p>
                    </div>
                </a>

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
