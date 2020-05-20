@extends('layouts.app')

@section('title', 'Home')
@section('content-title', 'Home')

@section('content')

    @include('includes.personal-header')
    @include('rating.includes.periods-json')

    <div class="container-table personal-room">
        <p class="lined-title">Персональний рейтинг</p>
        <p class="subtitle lined-title">Оберіть значення для фільтрації</p>
        <div class="filter-wrap rating-filter">
            <p>Відфільтрувати рейтинг:</p>
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
                        <th>Захід</th>
                        <th>Дата проведення</th>
                        <th>Посилання на рейтинг</th>
                        <th>Бал</th>
                        <th>Статус</th>
                        <th>Дії</th>
                    </tr>
                    <tr>
                        <td>Участь в гала концерті ГВ 2020</td>
                        <td>07.05.2020</td>
                        <td>Блок 4.2 пункт 8</td>
                        <td>1,5</td>
                        <td>
                            <div class="status">
                                <div class="icon">
                                    <svg>
                                        <use xlink:href="#load"></use>
                                    </svg>
                                </div>
                                <p>В обробці</p>
                            </div>
                        </td>
                        <td>
                            <div class="data-item"
                                 data-item='{
                                        "id": "1",
                                        "name": "Участь в гала концерті ГВ 2020",
                                        "date": "07.05.2020",
                                        "block": "1.1",
                                        "punkt": "2"
                                    }'>
                                <a class="action-btn change" onclick="callModal(event)" href="#">Змінити</a>
                                <a class="action-btn delete" onclick="callModal(event, 'Видалити рейтинг?')" href="#">Видалити</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Участь в гала концерті ГВ 2020 2</td>
                        <td>08.05.2020</td>
                        <td>Блок 4.2 пункт 8</td>
                        <td>1,5</td>
                        <td>
                            <div class="status">
                                <div class="icon">
                                    <svg>
                                        <use xlink:href="#edit"></use>
                                    </svg>
                                </div>
                                <p>Відредаговано</p>
                            </div>
                        </td>
                        <td>
                            <div class="data-item" data-item='{
                                        "id": "2",
                                        "name": "Участь в гала концерті ГВ 2020 2",
                                        "date": "08.05.2020",
                                        "block": "1.2",
                                        "punkt": "4"
                                    }'>
                                <a class="action-btn confirm" onclick="callModal(event, 'Підтвердити рейтинг?')"
                                   href="#">Підтвердити</a>
                                <a class="action-btn change" onclick="callModal(event)" href="#">Змінити</a>
                                <a class="action-btn delete" onclick="callModal(event, 'Видалити рейтинг?')" href="#">Видалити</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Участь в гала концерті ГВ 2020 3</td>
                        <td>07.05.2020</td>
                        <td>Блок 4.2 пункт 8</td>
                        <td>1,5</td>
                        <td>
                            <div class="status">
                                <div class="icon">
                                    <svg>
                                        <use xlink:href="#error"></use>
                                    </svg>
                                </div>
                                <p>Відхилено</p>
                            </div>
                        </td>
                        <td>
                            <div class="data-item" data-item='{
                                        "id": "1",
                                        "name": "Участь в гала концерті ГВ 2020 3",
                                        "date": "08.05.2020",
                                        "block": "1.1",
                                        "punkt": "3"
                                    }'>
                                <a class="action-btn change" onclick="callModal(event)" href="#">Змінити</a>
                                <a class="action-btn delete" onclick="callModal(event, 'Видалити рейтинг?')" href="#">Видалити</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Член збірної факультету, теніс</td>
                        <td>07.05.2020</td>
                        <td>Блок 4.2 пункт 8</td>
                        <td>1,5</td>
                        <td>
                            <div class="status">
                                <div class="icon">
                                    <svg>
                                        <use xlink:href="#success"></use>
                                    </svg>
                                </div>
                                <p>Підтверджено</p>
                            </div>

                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </div>
            <p class="total">Сума: 5,5 балів</p>
        </div>

    </div>

    <div id="edit-rating" style="display: none">
        <div class="modal-content">
            <form action="POST">
                <p class="subtitle lined-title">Редагування рейтингу</p>
                <label>
                    <input type="text" name="name" placeholder="Назва заходу, події*">
                </label>
                <label>
                    <input type="text" name="date" data-toggle="datepicker" placeholder="Дата проведення">
                </label>

                <div class="rating-grade">
                    <p class="subtitle lined-title">Оберіть блок та пункт</p>

                    <label class="select">
                        <span>Блок</span>
                        <select class="default-select" name="block">
                            <option data-placeholder="true">Оберіть блок</option>
                            <optgroup label="1. Студентська організація (СО) ">
                                <option value="1.1">1.1. Студентська організація (СО)</option>
                                <option value="1.2">1.2. Студентська рада (СР) гуртожитку</option>
                            </optgroup>
                        </select>
                    </label>
                    <label class="select">
                        <span>Пункт</span>
                        <select class="default-select" name="punkt">

                        </select>
                    </label>
                    <label class="total">
                        <span>Ваш бал за участь в заході: </span>
                        <input type="text" name="total" disabled value="0">
                    </label>
                </div>

                <input type="submit" class="main-btn" value="Зберегти">
            </form>
        </div>

    </div>


@endsection
