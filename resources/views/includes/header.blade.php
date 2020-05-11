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

        @php($current_locale = LaravelLocalization::getCurrentLocale())
        @foreach(LaravelLocalization::getSupportedLanguagesKeys() as $localeCode)
            @if($current_locale != $localeCode)
                <a lang="{{ $localeCode }}" href="{{ LaravelLocalization::getLocalizedURL($localeCode) }}" class="language user-nav-item">
                    <span class="icon">
                        <svg> <use xlink:href="#planet"></use></svg>
                    </span>
                    <span class="alternative-lang">{{ strtoupper($localeCode) }}</span>
                </a>
            @endif
        @endforeach

    </div>

</header>

{{--<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">--}}
{{--    @csrf--}}
{{--</form>--}}
{{--<a class="user-nav-item" href="{{ route('logout') }}"--}}
{{--   onclick="event.preventDefault();--}}
{{--       if (confirm('@lang('main.really-get-out')'))--}}
{{--       document.getElementById('logout-form').submit();">--}}
{{--    --}}{{-- Auth::user()->name --}}
{{--    <svg><use xlink:href="#exit"></use></svg>--}}
{{--</a>--}}
