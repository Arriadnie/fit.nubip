@extends('layouts.app')

@section('title', 'Home')
@section('content-title', 'Home')

@section('content')

    @include('includes.personal-header')
    @include('rating.includes.periods-json')

    <div class="container-table personal-room">
        <p class="lined-title">Формування звітів</p>
        <p class="subtitle lined-title">Оберіть значення для фільтрації</p>
        <div class="filter-wrap rating-filter">
            <p>Відфільтрувати рейтинг:</p>
            <label class="select">
                <select class="default-select" name="group" data-search="true">
                    @foreach(App\Models\Education\Group::all() as $group)
                        <option value="{{ $group->id }}">{{ $group->name }}</option>
                    @endforeach
                </select>
            </label>

            <label class="select">
                <select class="default-select"  data-synchronize='{"data": "periods", "select-name": "period", "search": "period-type-"}' name="period-type">
                    @foreach(PeriodType::all() as $period)
                        <option value="{{ $period->id }}">{{ $period->name }}</option>
                    @endforeach
                </select>
            </label>

            <label class="select">
                <select class="default-select" name="period">
                </select>
            </label>

            <a href="#" class="main-btn light rating-filter-button" data-page-method="getReport">Фільтрувати</a>
        </div>

        <div class="rating-wrap">
            <p class="subtitle lined-title">Рейтинг за вашим запитом:</p>
            <div class="rating-table">
                <table>
                    <tr>
                        <th>№</th>
                        <th>ПІП</th>
                        <th>Захід</th>
                        <th>Дата проведення</th>
                        <th>Посилання на рейтинг</th>
                        <th>Бал</th>
                        <th>Сума балів</th>
                    </tr>

                </table>
            </div>
            <a href="#" class="main-btn" id="report-generate">Згенерувати звіт</a>
        </div>

        <form method="GET" action="{{ route('home.rating.report-pdf') }}" class="hidden" id="report-form">
            @csrf
            <input type="text" name="groupId" value="" class="hidden">
            <input type="text" name="periodId" value="" class="hidden">
        </form>


    </div>



@endsection
