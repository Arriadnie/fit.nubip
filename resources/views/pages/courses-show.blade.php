@extends('layouts.app')

@section('title', '')

@section('description', '')
@section('body_class', 'courses-show')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')

    <div style="background: url({{ asset('/image/slide2.jpg') }}) no-repeat center center / cover; background-attachment: fixed;" class="page-header">
        <div class="page-header-overlay"></div>
        <div class="page-header-content">
            <h1>Спеціальності за освітнім ступенем "Бакалавр"</h1>
        </div>
    </div>

    <div class="container-125 courses-wrapper">

        <div class="left-bar">
            <div class="accordion-list">

                <div class="accordion-item">
                    <div class="accordion-title">
                        <a data-href="#ki" href="#ki">Комп'ютерна Інженерія</a>
                    </div>
                </div>

                <div class="accordion-item">
                    <div class="accordion-title">
                        <a data-href="#kn" href="#kn">Комп'ютерні науки</a>
                    </div>
                </div>


                <div class="accordion-item">
                    <div class="accordion-title">
                        <a data-href="#pi" href="#pi">Програмна інженерія </a>
                    </div>
                </div>

                {{--        For secon level        --}}

                <div class="accordion-item">
                    <div class="accordion-title closed" data-toggle-btn="economic">
                        <a href="#">Економіка</a>
                    </div>

                    <div class="accordion-body" data-toggle-block="economic">
                        <a data-href="#ek" href="#ek">Економічна кібернетика</a>
                        <a data-href="#de" href="#de">Цифрова економіка</a>
                    </div>

                </div>



            </div>
        </div>

        <div class="right-content">

            <div class="editor-content" data-id="#ki">
                Computer Ingeneering
            </div>
            <div class="editor-content" data-id="#kn">
                Computer Science
            </div>
            <div class="editor-content" data-id="#pi">
                Program Ingeneering
            </div>
            <div class="editor-content" data-id="#ek">
                Economical cybernetic
            </div>
            <div class="editor-content" data-id="#de">
                Digital economic
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
