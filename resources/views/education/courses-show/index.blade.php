@extends('layouts.app')

@section('title', $degree->name)

@section('description', '')
@section('body_class', 'courses-show')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')

    <div style="background: url({{ $degree->getImage(true) }}) no-repeat center center / cover; background-attachment: fixed;" class="page-header">
        <div class="page-header-overlay"></div>
        <div class="page-header-content">
            <h1>@lang('education.specialties-by-degree') "{{ $degree->getTranslatedAttribute('name') }}"</h1>
        </div>
    </div>

    <div class="container-125 courses-wrapper">

        @php
            $specialties = $degree->getSpecialtiesWithPrograms()
        @endphp

        <div class="left-bar">
            <div class="accordion-list">
                @foreach($specialties as $item)
                    @include('education.courses-show.list-item', [
                        'item' => $item
                    ])
                @endforeach
            </div>
        </div>

        <div class="right-content">

            @foreach($specialties as $item)
                @include('education.courses-show.description-item', [
                    'item' => $item
                ])
            @endforeach
        </div>
    </div>



@stop

@section('after_content')
@stop

@section('before_scripts')
@stop

@push('scripts')
@endpush
