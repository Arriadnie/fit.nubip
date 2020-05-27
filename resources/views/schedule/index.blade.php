@extends('layouts.app')

@section('title', 'Home')
@section('content-title', 'Home')

@section('content')
    @if(Auth::check())
        @include('includes.personal-header')
    @endif
    @include('includes.set-user-group-to-js')

    <div class="container-table personal-room">
        <p class="lined-title">Розклад занятть</p>
        <div class="filter-wrap schedule-filter">
            <p>Оберіть групу для розкладу:</p>
            <label class="select">
                <select class="default-select" name="group" data-search="true">
                    <option data-placeholder="true" value="">Група</option>
                    @foreach(App\Models\Education\Group::all() as $group)
                        <option value="{{ $group->id }}">{{ $group->name }}</option>
                    @endforeach
                </select>
            </label>

            <a href="#" class="main-btn light schedule-filter-button">Фільтрувати</a>

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
                        @foreach(\App\Models\Schedule\Lookups\Day::getAll() as $day)
                            <th>{{ $day->name }}</th>
                        @endforeach
                    </tr>
                </table>
            </div>
            <div class="table-wrap bottom">
                <table>
                    <tr>
                        <th>День/пара</th>
                        @foreach(\App\Models\Schedule\Lookups\Day::getAll() as $day)
                            <th>{{ $day->name }}</th>
                        @endforeach
                    </tr>
                </table>
            </div>
        </div>

        <div class="legend">
            <div class="legend-item">
                <div class="schedule-icon practice">
                    P
                </div>
                <p> - Практичне заняття</p>
            </div>
            <div class="legend-item">
                <div class="schedule-icon lecture">
                    L
                </div>
                <p> - Лекційне заняття</p>
            </div>
        </div>


    </div>



@endsection
