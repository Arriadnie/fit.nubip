@extends('layouts.app')

@section('title', 'Home')
@section('content-title', 'Home')

@section('content')
    @if (session('status'))
        <div class="alert alert-success" role="alert">
            {{ session('status') }}
        </div>
    @endif

    <div class="personal-menu">
        <div class="link">
            <a href="#">Розклад</a>
        </div>
        <div class="link">
            <a href="#">Рейтинг</a>
            <div class="sub-nav">
                <a class="sub-nav-item" href="#">Перегляд особистого</a>
                <a class="sub-nav-item" href="#">Внесення</a>
                <a class="sub-nav-item" href="#">Перевірка</a>
                <a class="sub-nav-item" href="#">Звіти</a>
            </div>
        </div>
        <div class="link">
            <a href="#">Особиста інформація</a>
        </div>
    </div>

    <div class="container-inner">
        <h1>Останні події</h1>

        <div class="personal-events">
            <div class="item">
                <div class="icon">
                    <svg><use xlink:href="#success"></use></svg>
                </div>
                <div class="content">
                    <p class="title">Рейтинг</p>
                    <p class="description">Ваш рейтинг було підтверджено. Щоб дізнатись свій рейтинг, перейдіть у розділ рейтинг.</p>
                </div>
            </div>

            <div class="item">
                <div class="icon">
                    <svg><use xlink:href="#error"></use></svg>
                </div>
                <div class="content">
                    <p class="title">Рейтинг</p>
                    <p class="description">Ваш рейтинг було видалено. Щоб дізнатись свій рейтинг, перейдіть у розділ рейтинг.</p>
                </div>
            </div>
            <div class="item">
                <div class="icon">
                    <svg><use xlink:href="#info"></use></svg>
                </div>
                <div class="content">
                    <p class="title">Розклад</p>
                    <p class="description">Розклад було змінено, перейдіть у розділ розклад щоб дізнатись зміни</p>
                </div>
            </div>
        </div>
    </div>


@endsection
