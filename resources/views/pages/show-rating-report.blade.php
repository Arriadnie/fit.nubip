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
                <select class="default-select" name="select-period">
                    <option value="mounth">Місяць</option>
                    <option value="semestr">Семестр</option>
                </select>
            </label>

            <label class="select">
                <select class="default-select" name="semestr">
                    <option value="1">Січень</option>
                    <option value="2">Лютий</option>
                    <option value="3">Березень</option>
                    <option value="4">Квітень</option>
                </select>
            </label>

            <label class="select">
                <select class="default-select" name="period3">
                    <option value="1">2020</option>
                    <option value="2">2018</option>
                    <option value="3">2017</option>
                    <option value="4">2016</option>
                </select>
            </label>
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
