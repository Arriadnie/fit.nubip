@extends('layouts.app')

@section('title', 'Персональний рейтинг')
@section('content-title', 'Home')

@section('content')

    @include('includes.personal-header')
    @include('rating.includes.periods-json')
    @include('rating.includes.current-period-to-js')

    <div class="container-table personal-room">
        <p class="lined-title">Персональний рейтинг</p>
        <p class="subtitle lined-title">Оберіть значення для фільтрації</p>
        <div class="filter-wrap rating-filter">
            <p>Відфільтрувати рейтинг:</p>
            <label class="select">
                <select class="default-select" data-synchronize='{"data": "periods", "select-name": "period", "search": "period-type-"}' name="period-type">
                    @foreach(PeriodType::all() as $period)
                        <option value="{{ $period->id }}">{{ $period->name }}</option>
                    @endforeach
                </select>
            </label>

            <label class="select">
                <select class="default-select" name="period">
                </select>
            </label>

            <a href="#" class="main-btn light rating-filter-button" data-page-method="getPersonal">Фільтрувати</a>
        </div>

        <div class="rating-wrap">
            <p class="subtitle lined-title">Рейтинг за вашим запитом:</p>
            <div class="rating-table">
                <table>
                    <tr>
                        <th>Захід</th>
                        <th>Дата проведення</th>
                        <th>Посилання на рейтинг</th>
                        <th>Бал</th>
                        <th>Статус</th>
                        <th>Дії</th>
                    </tr>
                </table>
            </div>
            <p class="total">Сума: <span id="score-sum">0</span> балів</p>
        </div>

    </div>

    @include('rating.includes.forms.edit', ['actionMode' => App\Http\Controllers\Rating\RatingController::PERSONAL_MODE])
    @include('rating.includes.forms.confirm', ['actionMode' => App\Http\Controllers\Rating\RatingController::PERSONAL_MODE])
    @include('rating.includes.forms.delete', ['actionMode' => App\Http\Controllers\Rating\RatingController::PERSONAL_MODE])

@endsection
