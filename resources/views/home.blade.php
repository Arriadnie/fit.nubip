@extends('layouts.app')

@section('title', 'Home')
@section('content-title', 'Home')

@section('content')

    @include('includes.personal-header')

    @include('includes.personal-notification')

    <div class="container-inner personal-room">
        <h1 class="lined-title">Особистий кабінет</h1>
        @php($user = Auth::user())

        <div class="personal-info">
            <div class="image">
                <img src="{{ Voyager::image($user->avatar) }}" alt="">
            </div>
            <div class="personal-info-details">
                <p class="name">{{ $user->name }}</p>

                @if($user->group)
                <p>Студент групи {{ $user->group->name }}</p>
                @endif

            </div>
        </div>

        <div class="add-personal-info">
            <form method="POST" action="{{ route('home.personal-info') }}">
                @csrf
                <div class="part">
                    <p class="lined-title">Додаткова інформація</p>
                    <label>
                        <textarea disabled name="description" placeholder="Інформація про себе">{{ $user->peopleInfo ? strip_tags($user->peopleInfo->description) : '' }}</textarea>
                    </label>
                    <label>
                        <input disabled type="tel" name="phone" placeholder="Номер телефону" value="{{ $user->peopleInfo ? $user->peopleInfo->phone : '' }}">
                    </label>
                    <label>
                        <input disabled type="email" name="email" placeholder="Email" value="{{ $user->peopleInfo->email ?? $user->email }}">
                    </label>
                    <a href="#" class="main-btn light enable-input disabled">Редагувати інформацію</a>
                    <input type="submit" class="main-btn hidden" value="Зберегти інформацію">
                </div>

                <div class="part">
                    <p class="lined-title">Соціальні мережі</p>
                    @foreach($user->peopleInfo ? $user->peopleInfo->getSocialNetworksWithEmpty() : App\Models\PeopleInfo\PeopleInfo::getEmptySocialNetworks() as $networkItem)
                        <label>
                            <span class="icon">
                                <img src="{{ $networkItem['network']->getImage(true) }}" alt="">
                            </span>
                            <input disabled type="text" name="social-network-{{ $networkItem['network']->id }}" placeholder="{{ $networkItem['network']->name }}" value="{{ $networkItem['value'] }}">
                        </label>
                    @endforeach
                </div>

            </form>
        </div>

        <div class="quick-access-container">
            <p class="lined-title">Розділи</p>
            <div class="quick-access">
                <a href="{{ route('home.rating.personal') }}" class="card">
                    <img src="{{ asset('/image/card3.jpg') }}" alt="">
                    <span class="name">Рейтинг</span>
                    <span class="overlay"></span>
                </a>

                <a href="{{ route('home.schedule.index') }}" class="card">
                    <img src="{{  asset('/image/card2.jpeg')  }}" alt="">
                    <span class="name">Розклад</span>
                    <span class="overlay"></span>
                </a>

            </div>
        </div>

    </div>

@endsection
