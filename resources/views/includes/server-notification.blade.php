@php($messages = Session::get('messages'))
@if(isset($messages) && !is_null($messages) && count($messages) > 0)
    <div class="server-notification-wrap">

        @foreach($messages as $message)
            <div class="server-notification-item {{ $message['type'] }}">
                <div class="icon">
                    <svg><use xlink:href="#{{ $message['type'] }}"></use></svg>
                </div>
                <p>{{ $message['text'] }}</p>
            </div>
        @endforeach
    </div>
@endif
