<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title{{ Setting::getLocalized('site.title') }}</title>

    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">


    <link rel="shortcut icon" href="{{ App\Traits\Imageable::getImageByColumnValue(setting('site.logo'), true) }}"
          type="image/svg">
</head>
<body>

<table>
    <tr>
        <th>№</th>
        <th>ПІП</th>
        <th>Захід</th>
        <th>Дата проведення</th>
        <th>Посилання на рейтинг</th>
        <th>Бал</th>
        <th>Сума балів</th>
    </tr>
    @include('rating.includes.report-table')
</table>


</body>
</html>

