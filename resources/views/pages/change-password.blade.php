@extends('layouts.app')

@section('title', '')
@section('content-title', 'Home')

@section('content')


    @include('includes.personal-header')
    <div class="container-inner personal-room">
        <p class="lined-title">Зміна паролю</p>
        <form action="">
            <p class="subtitle lined-title">Введіть старий пароль</p>
            <label>
                <input type="password" name="old" placeholder="Старий пароль">
            </label>
            <label>
                <input type="password" name="new">
            </label>
            <label>
                <input type="password" name="new">
            </label>
        </form>
    </div>


@endsection
