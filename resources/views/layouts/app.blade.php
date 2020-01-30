<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('title') - {{ setting('site.title') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body class="@yield('body_class')">

    <div class="main-wrapper @yield('wrapper_class')">
        @include('partials.header')

        @yield('before_content')
        <main class="@yield('main_class')">
            @yield('breadcrumbs')
            @yield('content')
        </main>
        @yield('after_content')

        @include('partials.footer')
    </div>

    {{--<script defer src="{{mix('js/manifest.js')}}"></script>
    <script defer src="{{mix('js/vendor.js')}}"></script>
    <script defer src="{{mix('js/app.js')}}"></script>
--}}


</body>
</html>
