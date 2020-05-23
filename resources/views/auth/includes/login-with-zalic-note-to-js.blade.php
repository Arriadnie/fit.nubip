

s

@php($withZalicNote = Session::get('loginWithZalicNote'))

@if(isset($withZalicNote) && !is_null($withZalicNote))
    <script>
        window.site.showZalikNoteLoginSide = {{ $withZalicNote }};
    </script>
@endif
