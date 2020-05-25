@extends('layouts.app')

@section('title', __("rating.entering-title"))
@section('content-title', 'Home')

@section('content')

    @include('includes.personal-header')

    <div class="container-inner personal-room">
        <p class="lined-title">@lang('rating.entering-title')</p>
        <form method="POST" action="{{ route('home.rating.create-personal') }}">
            @csrf
            <p class="subtitle lined-title">@lang('rating.entering-sub-title')</p>
            <label>
                <input type="text" name="name" placeholder="@lang('rating.event-name')">
            </label>
            <label>
                <input type="text" autocomplete="off" name="date" data-toggle="datepicker" placeholder="@lang('rating.event-date')">
            </label>

            <div class="rating-grade">
                <p class="subtitle lined-title">@lang('rating.select-item-title-1')<a href="#">@lang('rating.select-item-title-2')</a> </p>

                @include('rating.includes.forms.select-block')
                @include('rating.includes.forms.select-punkt')


                <label class="total">
                    <span>@lang('rating.your-score')</span>
                    <input type="text" name="total" disabled value="0">
                </label>

            </div>


            <input type="submit" class="main-btn" value="@lang('rating.submit')">
        </form>

    </div>




@endsection
