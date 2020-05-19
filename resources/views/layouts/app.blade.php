<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('title') - {{ Setting::getLocalized('site.title') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <script>
        window.rating_blocks = {

            "block_1.1":
                [
                    {
                        "text": "Голова СО Університету ",
                        "value": "2",
                        "bal": 2
                    },

                    {
                        "text": "Заступники голови СО Університету",
                        "value": "3",
                        "bal": 2
                    }
                ],

            "block_1.2":
            [
                    {
                        "text": "Голова об’єднаної студентської ради гуртожитків  ",
                        "value": "4",
                        "bal": 4
                    },
                    {
                        "text": "Голови СР гуртожитків ",
                        "value": "5",
                        "bal": 5
                    }
            ]

        }

    </script>


    <link rel="shortcut icon" href="{{ App\Traits\Imageable::getImageByColumnValue(setting('site.logo'), true) }}"
          type="image/svg">
</head>
<body class="@yield('body_class')">

<div class="main-wrapper @yield('wrapper_class')">
    @include('includes.header')

    @yield('before_content')
    <main class="@yield('main_class')">
        @yield('breadcrumbs')
        @yield('content')
    </main>
    @yield('after_content')

    @include('includes.footer')
</div>

@include('includes.svg')

<script defer src="{{mix('js/manifest.js')}}"></script>
<script defer src="{{mix('js/vendor.js')}}"></script>
<script defer src="{{mix('js/app.js')}}"></script>
<script defer src="{{mix('js/Helper.js')}}"></script>
<script defer src="{{mix('js/ajax-module.js')}}"></script>


</body>
</html>
