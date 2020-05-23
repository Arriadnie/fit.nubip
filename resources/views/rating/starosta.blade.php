@extends('layouts.app')

@section('title', 'Перевірка рейтингуs')
@section('content-title', 'Home')

@section('content')

    @include('includes.personal-header')

    <div class="container-table personal-room">
        <p class="lined-title">Перевірка рейтингу</p>

        <div class="rating-wrap">
            <p class="subtitle lined-title">Рейтинг що очікує перевірки:</p>
            <div class="rating-table">
                <table>
                    <tr>
                        <th>ПІП</th>
                        <th>Захід</th>
                        <th>Дата проведення</th>
                        <th>Посилання на рейтинг</th>
                        <th>Бал</th>
                        <th>Дії</th>
                    </tr>

                    @include('rating.includes.starosta-table')

                </table>
            </div>
        </div>

    </div>

    @include('rating.includes.forms.edit', ['actionMode' => App\Http\Controllers\Rating\RatingController::STAROSTA_MODE])
    @include('rating.includes.forms.confirm', ['actionMode' => App\Http\Controllers\Rating\RatingController::STAROSTA_MODE])
    @include('rating.includes.forms.delete', ['actionMode' => App\Http\Controllers\Rating\RatingController::STAROSTA_MODE])
    @include('rating.includes.forms.reject', ['actionMode' => App\Http\Controllers\Rating\RatingController::STAROSTA_MODE])

@endsection
