@extends('layouts.app')

@section('title', 'Home')
@section('content-title', 'Home')

@section('content')
    @if (session('status'))
        <div class="alert alert-success" role="alert">
            {{ session('status') }}
        </div>
    @endif

    You are logged in!
    <br>
    Your name is {{ Auth::user()->name }}

    {{ menu('main', 'menus/main') }}
    {!! $sliderView !!}

@endsection
