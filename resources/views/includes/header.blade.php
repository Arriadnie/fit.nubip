<header>
    <a href="/" class="logo-wrap">
        <img src="{{ App\Traits\Imageable::getImageByColumnValue(setting('site.logo'), true) }}" alt="">
    </a>

    <nav>
        {{ menu('main-navigation', 'menus/main-navigation') }}
    </nav>

    <div class="user-nav">
        @guest
            <a class="user-nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
        @else

            <a class="user-nav-item" href="{{ route('logout') }}"
               onclick="event.preventDefault();
               if (confirm('Ви дійсно бажаєте вийти?'))
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
