<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <!-- Styles -->
    <link href="{{ asset('css/zavalna.css') }}" rel="stylesheet">
</head>
<body>
<header>
    <nav>
        <a href="#">Про Інститут</a>
        <a href="#">Освітній процес</a>
        <a href="#">Наука</a>

        <div class="logo">
            <img src="{{ asset('/image/logo-kpi.png') }}" alt="">
        </div>

        <a href="#">Вступ</a>
        <a href="#">Підвищення кваліфікації</a>
        <a href="#">Контакти</a>
    </nav>
</header>
<main>
    <div class="first-screen">
        <div class="content">
            <p class="title">Про нас</p>
            <p class="text">Національне горнило підготовки кадрів із захисту державних інформаційних ресурсів в інформаційно-телекомунікаційних системах, в системах урядового зв'язку, криптографічного та технічного захисту інформації, кібербезпеки та кіберзахисту критичної інформаційної інфраструктури.</p>
        </div>
    </div>

    <div class="specialty">
        <p class="title">Спеціальності інституту</p>
        <div class="specialty-list">
            <div class="item">
                <img src="{{ asset('/image/kafedra1.png') }}" alt="">
                <div class="content">
                    <p>Комп'ютерні науки</p>
                </div>
            </div>
            <div class="item">
                <img src="{{ asset('/image/kafedra2.png') }}" alt="">
                <div class="content">
                    <p>Кібербезпека</p>
                </div>
            </div>
            <div class="item">
                <img src="{{ asset('/image/kafedra3.png') }}" alt="">
                <div class="content">
                    <p>Телекомунікації та радіотехніка</p>
                </div>
            </div>
        </div>
    </div>

</main>


</body>
</html>
