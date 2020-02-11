<div class="department-list">

    @foreach($infoblock->items as $item)
        @include('infoblocks/departments-list/item', [
            'item' => $item
        ])
    @endforeach

</div>
