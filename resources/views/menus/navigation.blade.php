@foreach($items as $menu_item)
    @if (count($menu_item->children) == 0)
    <li class="nav-item">
        <a class="nav-link" href="{{ url($menu_item->link()) }}">{{ $menu_item->title }}</a>
    </li>

    @else

    <li class="nav-item dropdown">
        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
            {{ $menu_item->title }} <span class="caret"></span>
        </a>

        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
            @foreach($menu_item->children as $menu_item_child)
                <a class="dropdown-item" href="{{ url($menu_item_child->link()) }}">{{ $menu_item_child->title }}</a>
            @endforeach
        </div>
    </li>
    @endif

@endforeach
