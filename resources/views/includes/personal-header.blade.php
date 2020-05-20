<div class="personal-menu">
    <div class="link">
        <a href="/schedule">Розклад</a>
    </div>
    <div class="link">
        <a href="#">Рейтинг</a>
        <div class="sub-nav">
            <a class="sub-nav-item" href="/rating/personal">Перегляд особистого</a>
            <a class="sub-nav-item" href="/rating/entering">Внесення</a>
            <a class="sub-nav-item" href="/rating/starosta">Перевірка</a>
            <a class="sub-nav-item" href="/rating/report">Звіти</a>
        </div>
    </div>
    <div class="link">
        <a href="#">Пропозиція новини</a>

    </div>
    <div class="link">
        <a href="/change-password">Пароль</a>
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
