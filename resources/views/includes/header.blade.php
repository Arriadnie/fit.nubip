<header>
    <a href="/" class="logo-wrap">
        <img src="{{ Storage::disk(config('voyager.storage.disk'))->url(setting('site.logo')) }}" alt="">
    </a>

    <nav>
        {{ menu('main-navigation', 'menus/main-navigation') }}
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
