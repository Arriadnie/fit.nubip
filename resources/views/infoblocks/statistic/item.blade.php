
<div class="statistic-item">
    <div class="statistic-icon">
        <img src="{{ $item->getImage(true) }}" alt="">
    </div>
    <p class="statistic-number" data-count="{{ explode(' ', $item->title)[0] }}">0</p>

    <p class="statistic-name">
        @for($i = 1; $i < count(explode(' ', $item->title)); $i++)
            {{ explode(' ', $item->title)[$i] }}
        @endfor
    </p>
</div>
