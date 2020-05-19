@extends('layouts.app')

@section('title', 'Home')
@section('content-title', 'Home')

@section('content')

    @include('includes.personal-header')

    <div class="container-table personal-room">
        <p class="lined-title">Розклад занятть</p>
        <div class="filter-wrap schedule-filter">
            <p>Оберіть групу для розкладу:</p>
            <label class="select">
                <select class="default-select " name="kurs">
                    <option data-placeholder="true" value="">Група</option>
                    <option value="1">КН-16001б</option>
                    <option value="1">КН-16002б</option>
                    <option value="1">КН-17001б</option>
                    <option value="1">КН-18001б</option>
                    <option value="1">КН-19001б</option>
                </select>
            </label>

            <div class="switch-wrap">
                <p class="left">Чисельник</p>
                <div class="switch-container">
                    <input id="switch-shadow" class="switch switch-shadow" type="checkbox">
                    <label for="switch-shadow" class="switch-label"></label>
                </div>
                <p class="right">Знаменник</p>
            </div>

        </div>


        <div class="schedule-table">
            <div class="table-wrap top">
                <table>
                    <tr>
                        <th>День/пара</th>
                        <th>Понеділок</th>
                        <th>Вівторок</th>
                        <th>Середа</th>
                        <th>Четвер</th>
                        <th>П'ятниця</th>
                    </tr>
                    <tr>
                        <th>1</th>
                        <td>Управління ІТ проектами, 214, к 15</td>
                        <td></td>
                        <td>Технології захисту інформації, 231, к 15</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td>Алгоритми і структ. даних, 214, к 15</td>
                        <td>Управління ІТ проектами, 214, к 15</td>
                        <td>Теорія прийняття рішень, 231, к 15</td>
                        <td></td>
                        <td>Технології захисту інформації, 231, к 15</td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td></td>
                        <td>Крос-платф. програмування, 231, к 15</td>
                        <td>Теорія прийняття рішень, 231, к 15</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td></td>
                        <td>Теорія прийняття рішень, 231, к 15</td>
                        <td></td>
                        <td></td>
                        <td>Теорія прийняття рішень, 231, к 15</td>
                    </tr>

                    <tr>
                        <th>5</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>Управління ІТ проектами, 214, к 15</td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>6</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>Теорія прийняття рішень, 231, к 15</td>
                        <td></td>
                    </tr>

                </table>
            </div>
            <div class="table-wrap bottom">
                <table>
                    <tr>
                        <th>День/пара</th>
                        <th>Понеділок</th>
                        <th>Вівторок</th>
                        <th>Середа</th>
                        <th>Четвер</th>
                        <th>П'ятниця</th>
                    </tr>

                    <tr>
                        <th>1</th>
                        <td>Алгоритми і структ. даних, 214, к 15</td>
                        <td>Управління ІТ проектами, 214, к 15</td>
                        <td>Теорія прийняття рішень, 231, к 15</td>
                        <td></td>
                        <td>Технології захисту інформації, 231, к 15</td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td>Управління ІТ проектами, 214, к 15</td>
                        <td></td>
                        <td>Технології захисту інформації, 231, к 15</td>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <th>3</th>
                        <td></td>
                        <td>Теорія прийняття рішень, 231, к 15</td>
                        <td></td>
                        <td></td>
                        <td>Теорія прийняття рішень, 231, к 15</td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td></td>
                        <td>Крос-платф. програмування, 231, к 15</td>
                        <td>Теорія прийняття рішень, 231, к 15</td>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <th>5</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>Управління ІТ проектами, 214, к 15</td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>6</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>Теорія прийняття рішень, 231, к 15</td>
                        <td></td>
                    </tr>

                </table>
            </div>
        </div>


    </div>



@endsection
