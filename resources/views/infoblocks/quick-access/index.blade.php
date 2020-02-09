<div class="quick-access-wrap"  style="background: url({{ $infoblock->getImage(true) }}) no-repeat center center / cover; background-attachment: fixed ">

    @foreach($infoblock->items as $item)
        @include('infoblocks/quick-access/item', [
            'item' => $item
        ])
    @endforeach

</div>
