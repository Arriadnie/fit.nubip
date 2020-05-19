<div class="btn btn-sm btn-danger pull-right delete" data-id="{{ $item->id }}">
    <i class="voyager-trash"></i> {{ __('voyager::generic.delete') }}
</div>
<a href="{{ route('voyager.'.$itemDataType->slug.'.edit', $item->{$item->getKeyName()}) }}" class="btn btn-sm btn-primary pull-right edit">
    <i class="voyager-edit"></i> {{ __('voyager::generic.edit') }}
</a>
@if($existsItemsBuilder)
    @if($itemsVisibleMethodName)
        @if($item->{$itemsVisibleMethodName}())
            <a href="{{ route('voyager.'.$itemDataType->slug.'.builder', $item->{$item->getKeyName()}) }}" class="btn btn-sm btn-success pull-right">
                <i class="voyager-edit"></i> {{ __('voyager::generic.builder') }}
            </a>
        @endif
    @else
        <a href="{{ route('voyager.'.$itemDataType->slug.'.builder', $item->{$item->getKeyName()}) }}" class="btn btn-sm btn-success pull-right">
            <i class="voyager-edit"></i> {{ __('voyager::generic.builder') }}
        </a>
    @endif
@endif
