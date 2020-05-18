@extends('layouts.app')

@section('title', 'Home')
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
                    <tr>
                        <td>Березанський Максим
                            Олександрович</td>
                        <td>Участь в гала концерті ГВ 2020</td>
                        <td>07.05.2020</td>
                        <td>Блок 4.2 пункт 8</td>
                        <td>1,5</td>

                        <td>
                            <div class="data-item"
                                 data-item='{
                                        "id": "1",
                                        "name": "Участь в гала концерті ГВ 2020",
                                        "date": "07.05.2020",
                                        "block": "1.1",
                                        "punkt": "2"
                                    }'>
                                <a class="action-btn confirm" onclick="callModal(event, 'Підтвердити рейтинг?')"
                                   href="#">Підтвердити</a>
                                <a class="action-btn change" onclick="callModal(event)" href="#">Змінити</a>
                                <a class="action-btn deny" onclick="callModal(event)" href="#">Відхилити</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Бойко Іван Павлович</td>
                        <td>Участь в гала концерті ГВ 2020 2</td>
                        <td>08.05.2020</td>
                        <td>Блок 4.2 пункт 8</td>
                        <td>1,5</td>
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
                                <a class="action-btn deny" onclick="callModal(event)" href="#">Відхилити</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Зима Анна Володимирівна</td>
                        <td>Участь в гала концерті ГВ 2020 3</td>
                        <td>07.05.2020</td>
                        <td>Блок 4.2 пункт 8</td>
                        <td>1,5</td>
                        <td>
                            <div class="data-item" data-item='{
                                        "id": "1",
                                        "name": "Участь в гала концерті ГВ 2020 3",
                                        "date": "08.05.2020",
                                        "block": "1.1",
                                        "punkt": "3"
                                    }'>
                                <a class="action-btn confirm" onclick="callModal(event, 'Підтвердити рейтинг?')"
                                   href="#">Підтвердити</a>
                                <a class="action-btn change" onclick="callModal(event)" href="#">Змінити</a>
                                <a class="action-btn deny" onclick="callModal(event)" href="#">Відхилити</a>
                            </div>
                        </td>
                    </tr>

                </table>
            </div>
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

    <div id="deny-rating" style="display: none">
        <div class="modal-content">
            <form action="POST">
                <p class="subtitle lined-title">Відхилення рейтингу</p>
                <label>
                    <textarea name="info" placeholder="Причина відхилення"></textarea>
                </label>

                <input type="submit" class="main-btn" value="Відхилити">
            </form>
        </div>

    </div>


@endsection
