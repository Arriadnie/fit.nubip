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

    <div class="container-inner personal-room">
        <p class="lined-title">Внесення особистого рейтингу</p>
        <form action="">
            <p class="subtitle lined-title">Введіть інформацію про захід в якому брали участь:</p>
            <label>
                <input type="text" placeholder="Назва заходу, події*">
            </label>
            <label>
                <input type="text" data-toggle="datepicker" placeholder="Дата проведення">
            </label>

            <div class="rating-grade">
                <p class="subtitle lined-title">Оберіть відповідний блок та пункт з <a href="#"> положень рейтину</a> </p>

                <label class="select">
                    <span>Блок</span>
                    <select class="default-select" name="block">
                        <option data-placeholder="true">Оберіть блок</option>
                        <optgroup label="1. Студентська організація (СО) ">
                            <option value="1.1">1.1. Студентська організація (СО) </option>
                            <option value="1.2">1.2. Студентська рада (СР) гуртожитку</option>
                        </optgroup>
                    </select>
                </label>
                <label class="select">
                    <span>Пункт</span>
                    <select class="default-select" name="punkt">
                        <option data-placeholder="true">Оберіть пункт</option>
                        <option value="1">Голова СО Університету ***</option>
                        <option value="2">Заступники голови СО Університету **,***</option>
                        <option value="3">Секретар СО Університету, керівники відділів СО Університету, керівники клубів за інтересами (на рівні університету) **</option>
                    </select>
                </label>


                <label class="total">
                    <span>Ваш бал за участь в заході: </span>
                    <input type="text" name="total" disabled value="0">
                </label>

            </div>


            <input type="submit" class="main-btn" value="Відправити">
        </form>

    </div>




@endsection
