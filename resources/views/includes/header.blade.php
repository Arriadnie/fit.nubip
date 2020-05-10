<header>
    <a href="/" class="logo-wrap">
        <img src="{{ App\Traits\Imageable::getImageByColumnValue(setting('site.logo'), true) }}" alt="">
    </a>

    <nav>
        {{ menu('main-navigation', 'menus/main-navigation') }}
    </nav>

    <div class="user-nav">
        @guest
            <a class="user-nav-item" href="{{ route('login') }}">  <svg><use xlink:href="#user"></use></svg></a>
        @else
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>
            <a class="user-nav-item" href="{{ route('logout') }}"
               onclick="event.preventDefault();
               if (confirm('Ви дійсно бажаєте вийти?'))
                document.getElementById('logout-form').submit();">
                {{-- Auth::user()->name --}}
                <svg><use xlink:href="#exit"></use></svg>
            </a>

        @endguest

        <a href="#" class="language user-nav-item">
            <span class="icon">
                <svg> <use xlink:href="#planet"></use></svg>
            </span>
            <span class="alternative-lang">
                EN
            </span>
        </a>
    </div>

</header>
