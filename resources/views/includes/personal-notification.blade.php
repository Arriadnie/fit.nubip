<div class="show-notifications">
    <svg><use xlink:href="#bell"></use></svg>
</div>

<div class="personal-events">
    @for($i=0; $i<2; $i++)
        <div class="item">
            <div class="icon">
                <svg><use xlink:href="#success"></use></svg>
            </div>
            <div class="content">
                <p class="title">Рейтинг</p>
                <p class="description">Ваш рейтинг було підтверджено. Щоб дізнатись свій рейтинг, перейдіть у розділ рейтинг.</p>
            </div>
        </div>
        <div class="item">
            <div class="icon">
                <svg><use xlink:href="#error"></use></svg>
            </div>
            <div class="content">
                <p class="title">Рейтинг</p>
                <p class="description">Ваш рейтинг було видалено. Щоб дізнатись свій рейтинг, перейдіть у розділ рейтинг.</p>
            </div>
        </div>
        <div class="item">
            <div class="icon">
                <svg><use xlink:href="#info"></use></svg>
            </div>
            <div class="content">
                <p class="title">Розклад</p>
                <p class="description">Розклад було змінено, перейдіть у розділ розклад щоб дізнатись зміни</p>
            </div>
        </div>
    @endfor
</div>
