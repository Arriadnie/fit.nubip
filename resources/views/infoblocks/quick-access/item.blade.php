<div class="quick-access-card">
    <div class="overlay"></div>
    <div class="quick-access-front">
        <div class="overlay"></div>
        <div class="quick-access-icon">
            <img src="{{ $item->getImage(true) }}" alt="">
        </div>
        <p class="quick-access-name">{{ $item->getTranslatedAttribute('title') }}</p>
    </div>

    <div class="quick-access-back">
        <div class="overlay"></div>

        @foreach($item->children as $childItem)
            @include('infoblocks/quick-access/child-item', [
                'item' => $childItem
            ])
        @endforeach
    </div>
</div>
