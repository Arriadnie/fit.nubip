@extends('layouts.app')

@section('title', '')
@section('content-title', 'Home')

@section('content')

    <div class="container-inner personal-room">
        <p class="lined-title">Введіть інформацію про себе</p>
        <form method="POST" action="{{ route('graduate-save-info') }}" class="partial">
            @csrf
            <div class="part">
                <p class="lined-title subtitle">Особиста інформація</p>
                <label>
                    <input type="text" name="name" placeholder="Ім'я">
                </label>
                <label>
                    <input type="email" name="email" placeholder="E-mail">
                </label>
                <label>
                    <input type="tel" name="tel" placeholder="Номер телефону">
                </label>
                <p class="lined-title subtitle">Інформація про кар'єру</p>
                <label>
                    <textarea name="description" placeholder="Інформація про навчання та кар'єру"></textarea>
                </label>

                <input type="submit" class="main-btn" value="Відправити">
            </div>

            <div class="part">
                <p class="lined-title subtitle">Соціальні мережі</p>
                @foreach(App\Models\PeopleInfo\PeopleInfo::getEmptySocialNetworks() as $networkItem)
                    <label>
                            <span class="icon">
                                <img src="{{ $networkItem['network']->getImage(true) }}" alt="">
                            </span>
                        <input type="text" name="social-network-{{ $networkItem['network']->id }}" placeholder="{{ $networkItem['network']->name }}" value="{{ $networkItem['value'] }}">
                    </label>
                @endforeach

                <p class="lined-title subtitle">Додайте зображення</p>
                <label class="file-label" data-placeholder="Прикіпіть фото">
                    <span class="placeholder">Прикіпіть фото</span>
                    <input name="file" type="file" >
                    <span class="file-icon">
                        <svg><use xlink:href="#file"></use></svg>
                    </span>

                </label>
                <label>
                    <input type="text" placeholder="Або ведіть посиланян на зображення">
                </label>
            </div>
        </form>
    </div>

@endsection
