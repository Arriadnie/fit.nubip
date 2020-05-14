@extends('layouts.app')

@section('title', 'Home')
@section('content-title', 'Home')

@section('content')
    @if (session('status'))
        <div class="alert alert-success" role="alert">
            {{ session('status') }}
        </div>
    @endif

    @include('includes.personal-header')




@endsection
