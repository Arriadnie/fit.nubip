@extends('layouts.app')

@section('title', setting('site.title'))

@section('description', '')
@section('body_class', 'students-page')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')

    <div style="background: url({{ asset('/image/students.jpg') }}) no-repeat center center / cover; background-attachment: fixed;" class="page-header">
        {{--        <img src="{{  }}" alt="">--}}
        <div class="page-header-overlay"></div>
        <div class="page-header-content">
            <h1>Наші студенти</h1>
        </div>
    </div>

    <div class="container-250">
        <div class="students-list">

            <div class="student-item">
                <div class="student-image">
                    <img src="{{ asset('/image/student2.jpg') }}" alt="">
                </div>

                <div class="student-info">
                    <p class="student-name">Анастасія Лозко</p>
                    <p class="student-about">Студентка спеціальності "Комп'ютерні науки" 2016 року випуску.
                        Software developer в компанції Globallogic
                    </p>
                    <div class="student-contact">
                        @foreach(App\Models\SocialNetwork::all() as $network)
                            <a href="{{ $network->link }}" target="_blank" class="student-contact-item">
                                <img src="{{ Storage::disk(config('voyager.storage.disk'))->url(json_decode($network->svg)[0]->download_link) }}" alt="">
                            </a>
                        @endforeach
                    </div>
                </div>


            </div>
            <div class="student-item">
                <div class="student-image">
                    <img src="{{ asset('/image/student1.jpg') }}" alt="">
                </div>

                <div class="student-info">
                    <p class="student-name">Анатолій Щербицький</p>
                    <p class="student-about">Студентк спеціальності "Комп'ютерні науки" 2016 року випуску.
                        Middle software deweloper в компанії SalesUp. Розробник BPM(Creatio) систем
                    </p>
                    <div class="student-contact">
                        @foreach(App\Models\SocialNetwork::all() as $network)
                            <a href="{{ $network->link }}" target="_blank" class="student-contact-item">
                                <img src="{{ Storage::disk(config('voyager.storage.disk'))->url(json_decode($network->svg)[0]->download_link) }}" alt="">
                            </a>
                        @endforeach
                    </div>
                </div>


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
