
<a href="{{ $item->getLink('button_link') }}" class="department-item">
    <img src="{{ $item->getImage(true) }}" alt="">
    <div class="department-name">
        <p>{{ $item->getTranslatedAttribute('title') }}</p>
    </div>
</a>
