@extends('layouts.app')

@section('title', setting('site.title'))

@section('description', '')
@section('body_class', 'login-page')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')

    @include('auth.includes.login-with-zalic-note-to-js')

    <div class="auth-page">
        <div class="auth-wrap">
            <div class="auth-container">
                <div class="forms-block">
                    <div class="login-block auth-block">

                        <div class="form-heading">
                            <div class="logo">
                                <img src="{{ Setting::getImage('site.logo') }}" alt="">
                            </div>
                        </div>

                        <p class="form-name">{{ __('auth.login') }}</p>

                        <form method="POST" action="{{ route('login') }}">
                            @csrf
                            <label class="column">
                                <input id="email" type="email" class="@error('email') is-invalid @enderror"
                                       name="email" placeholder="{{ __('auth.email') }}"
                                       value="{{ old('email') }}" required autocomplete="email" autofocus>
                                @error('email')
                                <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                @enderror
                            </label>


                            <label class="column">
                                <input id="passwor-email" type="password" class="@error('password') is-invalid @enderror"
                                       name="password"  placeholder="{{ __('auth.password') }}"
                                       required autocomplete="current-password">
                                @error('password')
                                <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                @enderror
                            </label>

                            <label class="checkbox-label">
                                <input type="checkbox" name="remember" id="remember-email" {{ old('remember') ? 'checked' : '' }}>
                                <span class="custom-check"></span>
                                {{ __('auth.remember-me') }}
                            </label>

                            <input type="submit" class="main-btn" value="{{ __('auth.log-in') }}">
                        </form>

                        <div class="form-bottom">
                            <div>
                                <a href="#" class="go-register">{{ __('auth.login-with-credit-note-number') }}</a>
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
                                <img src="{{ Setting::getImage('site.logo') }}" alt="">
                            </div>
                        </div>

                        <p class="form-name">{{ __('auth.login') }}</p>

                        <form method="POST" action="{{ route('login') }}">
                            @csrf
                            <label class="column">
                                <input id="credit_note_number" type="text" class="@error('credit_note_number') is-invalid @enderror"
                                       name="credit_note_number" placeholder="{{ __('auth.credit-note-number') }}"
                                       value="{{ old('credit_note_number') }}" required autocomplete="credit_note_number" autofocus>
                                @error('credit_note_number')
                                <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                @enderror
                            </label>

                            <label class="column">
                                <input id="password-credit_note_number" type="password" class="@error('password') is-invalid @enderror"
                                       name="password"  placeholder="{{ __('auth.password') }}"
                                       required autocomplete="current-password">
                                @error('password')
                                <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                @enderror
                            </label>

                            <label class="checkbox-label">
                                <input type="checkbox" name="remember" id="remember-credit_note_number" {{ old('remember') ? 'checked' : '' }}>
                                <span class="custom-check"></span>
                                {{ __('auth.remember-me') }}
                            </label>

                            <input type="submit" class="main-btn" value="{{ __('auth.log-in') }}">
                        </form>

                        <div class="form-bottom">
                            <div>
                                <a href="#" class="go-login">{{ __('auth.login-with-email') }}</a>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="auth-image-container">
                    <img src="{{ Setting::getImage('site.login-page-image') }}" alt="">
                    <div class="auth-image-content">
                        <div class="department-name">
                            <p class="university">{{ Setting::getLocalized('site.university-name') }}</p>
                            <p class="department">{{ Setting::getLocalized('site.department-name') }}</p>
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
