
<form method="POST" action="{{ route('home.rating.confirm') }}" class="hidden" id="confirm-form">
    @csrf
    <input type="text" name="id" value="" class="hidden">
    <input type="text" name="action" class="hidden" value="{{ $actionMode }}">
</form>
