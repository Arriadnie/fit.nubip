<div class="personal-menu">
    <div class="link">
        <a href="#">Розклад</a>
    </div>
    <div class="link">
        <a href="#">Рейтинг</a>
        <div class="sub-nav">
            <a class="sub-nav-item" href="/show-personal-rating">Перегляд особистого</a>
            <a class="sub-nav-item" href="/entering-rating">Внесення</a>
            <a class="sub-nav-item" href="#">Перевірка</a>
            <a class="sub-nav-item" href="#">Звіти</a>
        </div>
    </div>
    <div class="link">
        <a href="#">Пропозиція новини</a>

    </div>
    <div class="link">
        <a href="#">Особистий кабінет</a>
    </div>

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
</div>
