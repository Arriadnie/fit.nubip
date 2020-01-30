<header>
    <a href="/" class="logo-wrap">
        <img src="{{ url('storage/' . setting('site.logo')) }}" alt="">
    </a>

    <nav>
        <div class="nav-item">
            <a class="nav-link" href="#"><span>Про факультет</span></a>
        </div>
        <div class="nav-item">
            <a class="nav-link" href="#"><span>Вступнику</span></a>
            <div class="sub-nav">
                <a href="#" class="sub-nav-item">Правила прийому</a>
                <a href="#" class="sub-nav-item">Напрямки навчання</a>
                <a href="#" class="sub-nav-item">Випускникам шкіл</a>
                <a href="#" class="sub-nav-item">Випускникам коледжів</a>
                <a href="#" class="sub-nav-item">Магістратура</a>
            </div>
        </div>
        <div class="nav-item">
            <a class="nav-link" href="#"><span>Навчальна робота</span></a>
            <div class="sub-nav">
                <a href="#" class="sub-nav-item">Розклад занятть</a>
                <a href="#" class="sub-nav-item">Стипендія</a>
                <a href="#" class="sub-nav-item">Школа спотривного програмування</a>
            </div>
        </div>
        <div class="nav-item">
            <a class="nav-link" href="#"><span>Адміністрація</span></a>
        </div>
        <div class="nav-item">
            <a class="nav-link" href="#"><span>Студентська організація</span></a>
        </div>
        <div class="nav-item">
            <a class="nav-link" href="#"><span>Наші студенти</span></a>
        </div>
        <div class="nav-item">
            <a class="nav-link" href="{{ url('posts') }}"><span>Новини</span></a>
        </div>
    </nav>

    <div class="user-nav">
        @guest
            <li class="user-nav-item">

                <a class="user-nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
            </li>
            @if (Route::has('register'))
                <li class="user-nav-item">
                    <a class="user-nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                </li>
            @endif
        @else

            {{-- menu('navigation', 'menus/navigation') --}}

            <a class="user-nav-item" href="{{ route('logout') }}"
               onclick="event.preventDefault();
                                                         document.getElementById('logout-form').submit();">
                {{-- Auth::user()->name --}}
                <svg><use xlink:href="#user"></use></svg>
            </a>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>


        @endguest

    </div>
</header>
