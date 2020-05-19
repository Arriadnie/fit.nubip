@extends('layouts.app')

@section('title', __("rating.entering-title"))
@section('content-title', 'Home')

@section('content')
    @if (session('status'))
        <div class="alert alert-success" role="alert">
            {{ session('status') }}
        </div>
    @endif

    @include('includes.personal-header')

    <div class="container-inner personal-room">
        <p class="lined-title">@lang('rating.entering-title')</p>
        <form action="">
            <p class="subtitle lined-title">@lang('rating.entering-sub-title')</p>
            <label>
                <input type="text" placeholder="@lang('rating.event-name')">
            </label>
            <label>
                <input type="text" data-toggle="datepicker" placeholder="@lang('rating.event-date')">
            </label>

            <div class="rating-grade">
                <p class="subtitle lined-title">@lang('rating.select-item-title-1')<a href="#">@lang('rating.select-item-title-2')</a> </p>

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
                <label class="select">
                    <span>@lang('rating.item')</span>
                    <select class="default-select" name="punkt">
                        <option data-placeholder="true">@lang('rating.select-item')</option>
                    </select>
                </label>


                <label class="total">
                    <span>@lang('rating.your-score')</span>
                    <input type="text" name="total" disabled value="0">
                </label>

            </div>


            <input type="submit" class="main-btn" value="@lang('rating.submit')">
        </form>

    </div>




@endsection
