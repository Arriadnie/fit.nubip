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
                    <div class="login-block auth-block">

                        <div class="form-heading">
                            <div class="logo">
                                <img src="{{ App\Traits\Imageable::getImageByColumnValue(setting('site.logo'), true) }}" alt="">
                            </div>
                        </div>

                        <p class="form-name">Увійти</p>

                        <form method="POST" action="{{ route('login') }}">
                            @csrf
                            <label>
                                <input id="email" type="email" class="@error('email') is-invalid @enderror" name="email" placeholder="{{ __('E-Mail Address') }}" value="{{ old('email') }}" required autocomplete="email" autofocus>
                                @error('email')
                                <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                @enderror
                            </label>


                            <label>
                                <input id="password" type="password" class="@error('password') is-invalid @enderror" name="password"  placeholder="{{ __('Password') }}" required autocomplete="current-password">
                                @error('password')
                                <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                @enderror
                            </label>


                            <input type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                            <label for="remember">
                                {{ __('Remember Me') }}
                            </label>


                            <input type="submit" class="main-btn" value="Увійти">
                        </form>

                        <div class="form-bottom">
                            <div>
                                <p>Не має аккоунту? </p>
                                <a href="#" class="go-register">Зареєструватись</a>
                            </div>
                            @if (Route::has('password.request'))
                                <div class="forgot-password">

                                    <p>
                                        <a class="go-register" href="{{ route('password.request') }}">
                                            {{ __('Forgot Your Password?') }}
                                        </a>
                                    </p>
                                </div>
                            @endif
                        </div>

                    </div>
                    <div class="register-block auth-block">

                        <div class="form-heading">
                            <div class="logo">
                                <img src="{{ App\Traits\Imageable::getImageByColumnValue(setting('site.logo'), true) }}" alt="">
                            </div>
                        </div>

                        <p class="form-name">Створити акаунт</p>

                        <form method="POST" action="{{ route('register') }}">
                            @csrf
                            <label>
                                <input id="register-name" type="text" class="@error('name') is-invalid @enderror" name="name" placeholder="{{ __('Name') }}" value="{{ old('name') }}" required autocomplete="name" autofocus>
                                @error('name')
                                <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                @enderror
                            </label>
                            <label>
                                <input id="register-email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" placeholder="{{ __('E-Mail Address') }}" value="{{ old('email') }}" required autocomplete="email">
                                @error('email')
                                    <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                @enderror
                            </label>
                            <label>
                                <input id="register-password" type="password" class="@error('password') is-invalid @enderror" name="password"  placeholder="{{ __('Password') }}" required autocomplete="new-password">
                                @error('password')
                                <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                @enderror
                            </label>
                            <label>
                                <input id="register-password-confirm" type="password" class="@error('password') is-invalid @enderror" name="password_confirmation"  placeholder="{{ __('Confirm Password') }}" required autocomplete="new-password">
                            </label>

                            <input class="main-btn" type="submit" value="{{ __('Register') }}">
                        </form>

                        <div class="form-bottom">
                            <div>
                                <p>Уже маєте акаунт? </p>
                                <a href="#" class="go-login">Увійти</a>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="auth-image-container">
                    <img src="{{ asset('/image/slide1.jpg') }}" alt="">
                    <div class="auth-image-content">
                        <div class="department-name">
                            <p class="university">{{ setting('site.university-name') }}</p>
                            <p class="department">{{ setting('site.department-name') }}</p>
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
