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
                            <option data-placeholder="true">@lang('rating.select-block')</option>
                            @foreach(App\Models\Rating\RatingItemGroup::firstLevel()->get() as $group)
                                <optgroup label="{{ $group->getTranslatedAttribute('name') }}">
                                    @foreach($group->childrens as $item)
                                        <option value="{{ $item->id }}">{{ $item->getTranslatedAttribute('name') }}</option>
                                    @endforeach
                                </optgroup>
                            @endforeach
                        </select>
                    </label>
                    <label class="select">
                        <span>Пункт</span>
                        <select class="default-select" name="punkt">
                            <option data-placeholder="true">@lang('rating.select-item')</option>
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
