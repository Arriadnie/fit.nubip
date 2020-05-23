


@foreach($items as $item)

    @php($status = $item->getStatus())

    <tr>
        <td>{{ $item->name }}</td>
        <td>{{ $item->date->format('d-m-Y') }}</td>
        <td>{{ $item->ratingItem->group->name }} {{ $item->ratingItem->name }}</td>
        <td>{{ $item->ratingItem->score }}</td>
        <td>
            <div class="status">
                <div class="icon">
                    <svg>
                        <use xlink:href="#{{ $status['icon'] }}"></use>
                    </svg>
                </div>
                <p>{{ $status['name'] }}</p>
            </div>
        </td>
        <td>
            <div class="data-item"
                 data-item='{
                                        "id": "{{ $item->id }}",
                                        "name": "{{ $item->name }}",
                                        "date": "{{ $item->date->format('d.m.Y') }}",
                                        "block": "{{ $item->ratingItem->group->id }}",
                                        "punkt": "{{ $item->ratingItem->id }}"
                                    }'>
                @foreach($item->getActions() as $action)
                    <a class="action-btn {{ $action['class'] }}" onclick="ratingMethods.universal(event)" href="#">{{ $action['title'] }}</a>
                @endforeach
            </div>
        </td>
    </tr>
@endforeach

