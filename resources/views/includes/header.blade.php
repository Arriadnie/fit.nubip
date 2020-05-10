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
            <a class="user-nav-item" href="/home">  <svg><use xlink:href="#user"></use></svg></a>
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
