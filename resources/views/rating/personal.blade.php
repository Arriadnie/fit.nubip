@extends('layouts.app')

@section('title', 'Home')
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
            <p class="total">Сума: <span id="score-sum">5,5</span> балів</p>
        </div>

    </div>

    <div id="edit-rating" style="display: none">
        <div class="modal-content">
            <form method="POST" action="{{ route('home.rating.edit') }}" id="edit-form">
                @csrf
                <p class="subtitle lined-title">Редагування рейтингу</p>
                <input type="text" name="id" value="" class="hidden">
                <input type="text" name="period-type-input" value="" class="hidden">
                <input type="text" name="period-input" value="" class="hidden">
                <label>
                    <input type="text" name="name" placeholder="Назва заходу, події*">
                </label>
                <label>
                    <input type="text" name="date" data-toggle="datepicker" placeholder="Дата проведення">
                </label>

                <div class="rating-grade">
                    <p class="subtitle lined-title">Оберіть блок та пункт</p>

                    @include('rating.includes.select-block')
                    @include('rating.includes.select-punkt')

                    <label class="total">
                        <span>Ваш бал за участь в заході: </span>
                        <input type="text" name="total" disabled value="0">
                    </label>
                </div>
                <input type="text" name="action" class="hidden" value="{{ App\Http\Controllers\Rating\RatingController::PERSONAL_EDIT_MODE }}">

                <input type="submit" class="main-btn" value="Зберегти">
            </form>
        </div>

    </div>

    <form method="POST" action="{{ route('home.rating.confirm') }}" class="hidden" id="confirm-form">
        @csrf
        <input type="text" name="id" value="" class="hidden">
        <input type="text" name="period-type-input" value="" class="hidden">
        <input type="text" name="period-input" value="" class="hidden">
        <input type="text" name="action" class="hidden" value="{{ App\Http\Controllers\Rating\RatingController::PERSONAL_EDIT_MODE }}">
    </form>
    <form method="POST" action="{{ route('home.rating.delete') }}" class="hidden" id="delete-form">
        @csrf
        <input type="text" name="id" value="" class="hidden">
        <input type="text" name="period-type-input" value="" class="hidden">
        <input type="text" name="period-input" value="" class="hidden">
        <input type="text" name="action" class="hidden" value="{{ App\Http\Controllers\Rating\RatingController::PERSONAL_EDIT_MODE }}">
    </form>


@endsection
