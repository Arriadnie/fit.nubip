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

    <div class="editor-wrap">
        <div class="editor-content">
            @include('infoblocks.departments-list.index', [
                'infoblock' => App\Models\Infoblocks\Infoblock::findBySlug('kafedri-fakul-tetu')
            ])
        </div>
    </div>


@stop

@section('after_content')
@stop

@section('before_scripts')
@stop

@push('scripts')
@endpush
