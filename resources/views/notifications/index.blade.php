@foreach($items as $item)
    <div class="item {{ !$item->is_shown ? 'active' : '' }}">
        <div class="icon">
            <svg><use xlink:href="#{{ strtolower($item->type) }}"></use></svg>
        </div>
        <div class="content">
            <p class="title">{{ $item->title }}</p>
            <p class="description">{{ $item->message }}</p>
        </div>
    </div>
@endforeach
