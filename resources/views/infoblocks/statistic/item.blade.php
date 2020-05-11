
<div class="statistic-item">
    @php($item_title = $item->getTranslatedAttribute('title'))
    <div class="statistic-icon">
        <img src="{{ $item->getImage(true) }}" alt="">
    </div>
    <p class="statistic-number" data-count="{{ explode(' ', $item_title)[0] }}">0</p>

    <p class="statistic-name">
        {{ substr($item_title, strpos($item_title, ' ') + 1) }}
    </p>
</div>
