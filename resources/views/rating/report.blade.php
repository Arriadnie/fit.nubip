@extends('layouts.app')

@section('title', 'Home')
@section('content-title', 'Home')

@section('content')

    @include('includes.personal-header')

    <div class="container-table personal-room">
        <p class="lined-title">Формування звітів</p>
        <p class="subtitle lined-title">Оберіть значення для фільтрації</p>
        <div class="filter-wrap rating-filter">
            <p>Відсотрувати рейтинг:</p>
            <label class="select">
                <select class="default-select" name="period-type">
                    @foreach(PeriodType::all() as $period)
                        <option value="{{ $period->id }}">{{ $period->name }}</option>
                    @endforeach
                </select>
            </label>

            <label class="select">
                <select class="default-select" name="period">
                    <option value="1">Січень 2020</option>
                    <option value="2">Лютий 2020</option>
                    <option value="3">Березень 2020</option>
                    <option value="4">Квітень 2020</option>
                </select>
            </label>

            <a href="#" class="main-btn light">Фільтрувати</a>
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
                    <tr>
                        <td>1</td>
                        <td>Березанський Максим
                            Олександрович</td>
                        <td>Участь в гала концерті ГВ 2020</td>
                        <td>07.05.2020</td>
                        <td>Блок 4.2 пункт 8</td>
                        <td>1,5</td>
                        <td>3,5</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Бойко Іван Павлович</td>
                        <td>Участь в гала концерті ГВ 2020 2</td>
                        <td>08.05.2020</td>
                        <td>Блок 4.2 пункт 8</td>
                        <td>1,5</td>

                        <td>4,5</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Зима Анна Володимирівна</td>
                        <td>Участь в гала концерті ГВ 2020 3</td>
                        <td>07.05.2020</td>
                        <td>Блок 4.2 пункт 8</td>
                        <td>1,5</td>
                        <td>4,5</td>
                    </tr>

                </table>
            </div>

            <a href="#" class="main-btn">Згенерувати звіт</a>
        </div>



    </div>



@endsection
