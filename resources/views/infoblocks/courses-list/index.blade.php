<div class="courses-list">

    @foreach($infoblock->items as $item)
        @include('infoblocks/courses-list/item', [
            'item' => $item
        ])
    @endforeach

</div>
