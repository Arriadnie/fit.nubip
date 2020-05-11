<ul>
    @foreach($items as $menu_item)
    <li>
        <a href="{{ url($menu_item->link()) }}">{{ $menu_item->getTranslatedAttribute('title') }}</a>

        @if (count($menu_item->children) > 0)
            @include('menus.main', [
                'items' => $menu_item->children
            ])
        @endif
    </li>
    @endforeach
</ul>
