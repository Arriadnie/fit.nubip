@extends('layouts.app')

@section('title', '')
@section('content-title', 'Home')

@section('content')


    @include('includes.personal-header')

    <div class="container-inner personal-room">
        <p class="lined-title">Зміна паролю</p>
        <form method="POST"  action="{{ route('home.change-password-post') }}">
            @csrf
            <p class="subtitle lined-title">Введіть старий пароль</p>
            <label class="column">
                <input type="password" name="password-old" placeholder="Старий пароль">
                @error('password-old')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </label>
            <p class="subtitle lined-title">Введіть новий пароль</p>
            <label class="column">
                <input type="password" name="password-new" placeholder="Новий пароль">
                @error('password-new')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </label>
            <label class="column">
                <input type="password" name="password-confirm" placeholder="Новий пароль">
                @error('password-confirm')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </label>
            <input type="submit" class="main-btn" value="Зберегти">
        </form>
    </div>


@endsection
