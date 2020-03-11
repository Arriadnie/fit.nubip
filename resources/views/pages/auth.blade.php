@extends('layouts.app')

@section('title', setting('site.title'))

@section('description', '')
@section('body_class', 'login-page')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')

    <div class="auth-page">
        <div class="auth-wrap">
            <div class="auth-container">
                <div class="forms-block">
                    <div class="register-block auth-block">

                        <div class="form-heading">
                            <div class="logo">
                                <img src="{{ App\Traits\Imageable::getImageByColumnValue(setting('site.logo'), true) }}" alt="">
                            </div>
                        </div>

                        <p class="form-name">Створити акаунт</p>

                        <form action="">
                            <label>
                                <input type="text" placeholder="Ім'я">
                            </label>
                            <label>
                                <input type="email" placeholder="Email">
                            </label>
                            <label>
                                <input type="password" placeholder="Пароль">
                            </label>

                            <input class="main-btn" type="submit" value="Зареєструватись">
                        </form>

                        <div class="form-bottom">
                            <p>Ужа маєте акаунт? </p>
                            <a href="#" class="go-login">Увійти</a>
                        </div>

                    </div>
                    <div class="login-block auth-block">

                        <div class="form-heading">
                            <div class="logo">
                                <img src="{{ App\Traits\Imageable::getImageByColumnValue(setting('site.logo'), true) }}" alt="">
                            </div>
                        </div>

                        <p class="form-name">Увійти</p>

                        <form action="">

                            <label>
                                <input type="email" placeholder="Email">
                            </label>
                            <label>
                                <input type="password" placeholder="Пароль">
                            </label>

                            <input type="submit" class="main-btn" value="Увійти">
                        </form>

                        <div class="form-bottom">
                            <p>Не має аккоунту? </p>
                            <a href="#" class="go-register">Зареєструватись</a>
                        </div>

                    </div>
                </div>
                <div class="auth-image-container">
                    <img src="{{ asset('/image/slide1.jpg') }}" alt="">
                    <div class="auth-image-content">
                        <div class="department-name">
                            <p class="university">Національний Університет Біоресурсів і Природокористування України</p>
                            <p class="department">Факультет Інформаційних Технологій</p>
                        </div>
                    </div>
                    <div class="overlay-light"></div>

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
