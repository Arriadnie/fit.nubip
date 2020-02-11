@extends('layouts.app')

@section('title', setting('site.title'))

@section('description', '')
@section('body_class', '')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')

    <div style="background: url({{ asset('/image/students.jpg') }}) no-repeat center center / cover; background-attachment: fixed;" class="page-header">
        {{--        <img src="{{  }}" alt="">--}}
        <div class="page-header-overlay"></div>
        <div class="page-header-content">
            <h1>Кафедра інформаційних систем</h1>
        </div>
    </div>

    <div class="editor-wrap">
        <div class="editor-content">
            [infoblock code="shvidenko-zaviduvach"]

            <p>Кафедра інформаційних систем створена в 1997р. Основною метою діяльності кафедри є підготовка спеціалістів, які забезпечують розробку і впровадження інформаційних систем та комп’ютерних технологій в агропромисловому комплексі. Кафедра веде підготовку студентів факультету інформаційних технологій, економічного факультету, факультету аграрного менеджменту та навчально-наукового інституту післядипломної освіти.</p>
            <p>&nbsp;</p>
            <p>На кафедрі постійно йде процес поліпшення матеріальної, навчальної і методичної бази, започатковуються нові дисципліни, які відповідають сучасним вимогам. Ще в кінці 90-х років, першою серед аграрних вищих навчальних закладів України, кафедра запровадила елементи дистанційного навчання у навчальний процес. При цьому активно проводились семінари різного рівня, створювались електронні навчальні посібники, велась просвітницька діяльність по впровадженню дистанційного навчання як ефективного напрямку більш повної реалізації прав громадян на освіту. Кафедра інформаційних систем першою адаптувала на українську мову міжнародну систему дистанційного навчання Moodle, яка нині ефективно використовується університетом у навчальному процесі.</p>

            @include('gallery.index')
            <p>&nbsp;</p>

            @include('infoblocks.default-slider.index', [
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
