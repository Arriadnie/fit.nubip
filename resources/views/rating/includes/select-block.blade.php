
<label class="select">
    <span>@lang('rating.block')</span>
    <select class="default-select" name="block">
        <option data-placeholder="true">@lang('rating.select-block')</option>
        @foreach(App\Models\Rating\RatingItemGroup::firstLevel()->get() as $group)
            <optgroup label="{{ $group->getTranslatedAttribute('name') }}">
                @foreach($group->childrens as $item)
                    <option value="{{ $item->id }}">{{ $item->getTranslatedAttribute('name') }}</option>
                @endforeach
            </optgroup>
        @endforeach
    </select>
</label>
