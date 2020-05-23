

@foreach($items as $item)
    <tr>
        <td>{{ $item->user->name }}</td>
        <td>{{ $item->name }}</td>
        <td>{{ $item->date->format('d-m-Y') }}</td>
        <td>{{ $item->ratingItem->group->name }} {{ $item->ratingItem->name }}</td>
        <td>{{ $item->ratingItem->score }}</td>
        <td>
            <div class="data-item"
                 data-item='{
                                        "id": "{{ $item->id }}",
                                        "name": "{{ $item->name }}",
                                        "date": "{{ $item->date->format('d.m.Y') }}",
                                        "block": "{{ $item->ratingItem->group->id }}",
                                        "punkt": "{{ $item->ratingItem->id }}"
                                    }'>
                @foreach($item->getStarostaActions() as $action)
                    <a class="action-btn {{ $action['class'] }}" onclick="ratingMethods.universal(event)" href="#">{{ $action['title'] }}</a>
                @endforeach
            </div>
        </td>
    </tr>
@endforeach

