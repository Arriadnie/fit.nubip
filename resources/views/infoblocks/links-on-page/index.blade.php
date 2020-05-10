<div class="links-on-page-list">

    @foreach($infoblock->items as $item)
        @include('infoblocks/links-on-page/item', [
            'item' => $item
        ])
    @endforeach

</div>
