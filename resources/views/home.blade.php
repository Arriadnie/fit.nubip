@extends('layouts.app')

@section('title', 'Home')
@section('content-title', 'Home')

@section('content')
    @if (session('status'))
        <div class="alert alert-success" role="alert">
            {{ session('status') }}
        </div>
    @endif

    @include('includes.personal-header')

    @include('includes.personal-notification')

    <div class="container-inner personal-room">
        <h1 class="lined-title">Особистий кабінет</h1>

        <div class="personal-info">
            <div class="image">
                <img src="{{ asset('/image/student1.jpg') }}" alt="">
            </div>
            <div class="personal-info-details">
                <p class="name">Андрій Клименко</p>
                <p>4 курс спеціальність "Комп'ютерні ноуки" група КН-16003б</p>

            </div>
        </div>

        <div class="add-personal-info">
            <form action="">

                <div class="part">
                    <p class="lined-title">Додаткова інформація</p>
                    <label>
                        <textarea disabled name="info" placeholder="Інформація про себе"></textarea>
                    </label>
                    <label>
                        <input disabled type="tel" placeholder="Номер телефону">
                    </label>
                    <a href="#" class="main-btn light enable-input disabled">Редагувати інформацію</a>
                    <input type="submit" class="main-btn hidden" value="Зберегти інформацію">
                </div>

                <div class="part">
                    <p class="lined-title">Соціальні мережі</p>
                    <label>
                        <span class="icon">
                            <svg><use xlink:href="#instagram"></use></svg>
                        </span>
                        <input disabled type="text" placeholder="Instagram">
                    </label>
                    <label>
                        <span class="icon">
                            <svg><use xlink:href="#facebook"></use></svg>
                        </span>
                        <input disabled type="text" placeholder="Facebook">
                    </label>
                    <label>
                        <span class="icon">
                            <svg><use xlink:href="#youtube"></use></svg>
                        </span>
                        <input disabled type="text" placeholder="Youtube">
                    </label>
                </div>

            </form>
        </div>

        <div class="quick-access-container">
            <p class="lined-title">Розділи</p>
            <div class="quick-access">
                <a href="#" class="card">
                    <img src="{{ asset('/image/card3.jpg') }}" alt="">
                    <span class="name">Рейтинг</span>
                    <span class="overlay"></span>
                </a>

                <a href="#" class="card">
                    <img src="{{  asset('/image/card2.jpeg')  }}" alt="">
                    <span class="name">Розклад</span>
                    <span class="overlay"></span>
                </a>

            </div>
        </div>

    </div>

@endsection
