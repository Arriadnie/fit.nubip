<div class="personal-menu">
    <div class="link">
        <a href="{{ route('home.schedule.index') }}">Розклад</a>
    </div>
    <div class="link">
        <a href="#">Рейтинг</a>
        <div class="sub-nav">
            <a class="sub-nav-item" href="{{ route('home.rating.personal') }}">Перегляд особистого</a>
            <a class="sub-nav-item" href="{{ route('home.rating.entering') }}">Внесення</a>

            @if(Auth::user()->hasRole(['admin', 'starosta']))
            <a class="sub-nav-item" href="{{ route('home.rating.starosta') }}">Перевірка</a>
            @endif
            <a class="sub-nav-item" href="{{ route('home.rating.report') }}">Звіти</a>
        </div>
    </div>
    @if(Auth::user()->hasPermission('offer_posts'))
        <div class="link">
            <a href="{{ route('home.post-offer') }}">Пропозиція новини</a>
        </div>
    @endif
    <div class="link">
        <a href="{{ route('home.change-password') }}">Пароль</a>
    </div>



    <div class="user-nav-list">
        @if(Auth::user()->hasPermission('browse_admin'))
            <a class="user-nav-item" href="{{ route('voyager.dashboard') }}">
                <svg>
                    <use xlink:href="#admin"></use>
                </svg>
            </a>
        @endif

        <a class="user-nav-item" href="{{ route('logout') }}"
           onclick="callModalConfirm(event, '{{ __('auth.really-logout') }}', () => document.getElementById('logout-form').submit())">
            <svg>
                <use xlink:href="#exit"></use>
            </svg>
        </a>
        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
            @csrf
        </form>

    </div>

</div>
