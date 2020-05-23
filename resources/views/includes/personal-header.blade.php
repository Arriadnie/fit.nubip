<div class="personal-menu">
    <div class="link">
        <a href="/home/schedule">Розклад</a>
    </div>
    <div class="link">
        <a href="#">Рейтинг</a>
        <div class="sub-nav">
            <a class="sub-nav-item" href="{{ route('home.rating.personal') }}">Перегляд особистого</a>
            <a class="sub-nav-item" href="{{ route('home.rating.entering') }}">Внесення</a>
            <a class="sub-nav-item" href="{{ route('home.rating.starosta') }}">Перевірка</a>
            <a class="sub-nav-item" href="{{ route('home.rating.report') }}">Звіти</a>
        </div>
    </div>
    <div class="link">
        <a href="#">Пропозиція новини</a>

    </div>
    <div class="link">
        <a href="{{ route('home.change-password') }}">Пароль</a>
    </div>



    <div class="user-nav-list">
        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
            @csrf
        </form>
        <a class="user-nav-item" href="{{ route('logout') }}"
           onclick="event.preventDefault();
               if (confirm('Ви дійсно бажаєте вийти?'))
                document.getElementById('logout-form').submit();">
            {{-- Auth::user()->name --}}
            <svg>
                <use xlink:href="#exit"></use>
            </svg>
        </a>
        <a class="user-nav-item">

            <svg>
                <use xlink:href="#exit"></use>
            </svg>
        </a>
    </div>

</div>
