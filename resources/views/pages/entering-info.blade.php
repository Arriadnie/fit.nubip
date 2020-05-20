@extends('layouts.app')

@section('title', '')
@section('content-title', 'Home')

@section('content')

    <div class="container-inner personal-room">
        <p class="lined-title">Введіть інформацію про себе</p>
        <form action="" class="partial">
            <div class="part">
                <p class="lined-title subtitle">Особиста інформація</p>
                <label>
                    <input type="name" placeholder="Ім'я">
                </label>
                <label>
                    <input type="tel" placeholder="Номер телефону">
                </label>
                <label>
                    <input type="year" placeholder="Рік випуску">
                </label>
                <label>
                    <input type="specialty" placeholder="Спеціальність">
                </label>
                <p class="lined-title subtitle">Інформація про кар'єру</p>
                <label>
                    <textarea name="info" placeholder="Інформація про кар'єру"></textarea>
                </label>

                <input type="submit" class="main-btn" value="Відправити">
            </div>

            <div class="part">
                <p class="lined-title subtitle">Соціальні мережі</p>
                <label>
                    <span class="icon">
                        <svg><use xlink:href="#instagram"></use></svg>
                    </span>
                    <input disabled type="text" placeholder="Instagram">
                </label>
                <label>
                    <span class="icon">
                        <svg><use xlink:href="#facebook"></use></svg>
                    </span>
                    <input disabled type="text" placeholder="Facebook">
                </label>
                <label>
                    <span class="icon">
                        <svg><use xlink:href="#youtube"></use></svg>
                    </span>
                    <input disabled type="text" placeholder="Youtube">
                </label>

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
