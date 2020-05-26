@extends('layouts.app')

@section('title', 'Home')
@section('content-title', 'Home')

@section('content')
   <div class="error-wrap">
       <div class="error-content">
           <p class="num">404</p>
           <div class="text">
               <p>Сторінку не знайдено</p>

           </div>
       </div>

       <a href="{{ route('index') }}" class="main-btn light">Повернутись на головну</a>
   </div>

@endsection
