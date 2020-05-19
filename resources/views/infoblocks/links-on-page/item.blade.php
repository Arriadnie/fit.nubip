
<a href="{{ $item->getLink('button_link') }}" class="links-on-page-item">
    {{ $item->getTranslatedAttribute('title') }}
    <span class="icon">
        <img src="{{ asset('/image/file.svg') }}" alt="">
    </span>
</a>
