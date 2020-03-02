
@extends('layouts.app')

@section('title', $degree->name)

@section('description', '')
@section('body_class', '')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')

    <div style="background: url({{ $degree->getImage(true) }}) no-repeat center center / cover; background-attachment: fixed;" class="page-header">
        <div class="page-header-overlay"></div>
        <div class="page-header-content">
            <h1>{{ $degree->name }}</h1>
        </div>
    </div>

    <div class="editor-wrap">
        <div class="editor-content">

            @php
                $specialties = $degree->getSpecialtiesWithPrograms()
            @endphp

            <div>
                @foreach($specialties as $item)
                    <ul>
                        @include('education.courses-show.list-item', [
                            'item' => $item
                        ])
                    </ul>
                @endforeach
            </div>



            <div>
                @foreach($specialties as $item)
                    <ul>
                        @include('education.courses-show.description-item', [
                            'item' => $item
                        ])
                    </ul>
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
