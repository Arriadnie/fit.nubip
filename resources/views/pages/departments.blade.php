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

            <a href="#" class="department-item">
                <img src="{{ asset('/image/department1.jpg') }}" alt="">
                <div class="department-name">
                    <p>Кафедра інформаційних і дистанційних технологій</p>
                </div>
            </a>

            <a href="#" class="department-item">
                <img src="{{ asset('/image/department2.jpg') }}" alt="">
                <div class="department-name">
                    <p>Кафедра інформаційних систем</p>
                </div>
            </a>

            <a href="#" class="department-item">
                <img src="{{ asset('/image/department3.jpg') }}" alt="">
                <div class="department-name">
                    <p>Кафедра економічної кібернетики</p>
                </div>
            </a>
            <a href="#" class="department-item">
                <img src="{{ asset('/image/department4.jpg') }}" alt="">
                <div class="department-name">
                    <p>Кафедра комп'ютених наук</p>
                </div>
            </a>


        </div>
    </div>


@stop

@section('after_content')
@stop

@section('before_scripts')
@stop

@push('scripts')
@endpush
