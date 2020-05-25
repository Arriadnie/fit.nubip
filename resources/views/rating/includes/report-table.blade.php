
@php($index = 1)
@foreach($items as $item)
    <tr>
        @if($item['user_count'] > 0)
        <td rowspan="{{ $item['user_count'] }}">{{ $index++ }}</td>
        <td rowspan="{{ $item['user_count'] }}">{{ $item['value']->user_name }}</td>
        @endif
        <td>{{ $item['value']->user_rating_item_name ?? '' }}</td>
        <td>{{ $item['value']->user_rating_item_date ? (new \Carbon\Carbon($item['value']->user_rating_item_date))->format('d-m-Y') : '' }}</td>
        @if($item['punkt_count'] > 0)
            <td rowspan="{{ $item['punkt_count'] }}">{{ $item['value']->user_rating_item_id ? ($item['value']->rating_item_group_name . ' ' . $item['value']->rating_item_name) : '' }}</td>
            <td rowspan="{{ $item['punkt_count'] }}">{{ $item['punkt_score'] }}</td>
        @endif
        @if($item['user_count'] > 0)
            <td rowspan="{{ $item['user_count'] }}">{{ $item['user_score'] }}</td>
        @endif
    </tr>
@endforeach


