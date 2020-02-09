<div class="statistic-wrap" style="background: url({{ $infoblock->getImage(true) }} ) no-repeat center center / cover; background-attachment: fixed ">

    @foreach($infoblock->items as $item)
        @include('infoblocks/statistic/item', [
            'item' => $item
        ])
    @endforeach

    <div class="overlay"></div>
</div>
