
<div id="reject-rating" style="display: none">
    <div class="modal-content">
        <form method="POST" action="{{ route('home.rating.reject') }}" id="reject-form">
            @csrf
            <input type="text" name="id" value="" class="hidden">
            <input type="text" name="period-type-input" value="" class="hidden">
            <input type="text" name="period-input" value="" class="hidden">
            <input type="text" name="action" class="hidden" value="{{ $actionMode }}">

            <p class="subtitle lined-title">Відхилення рейтингу</p>
            <label>
                <textarea name="reject-reason" placeholder="Причина відхилення"></textarea>
            </label>

            <input type="submit" class="main-btn" value="Відхилити">
        </form>
    </div>
</div>
