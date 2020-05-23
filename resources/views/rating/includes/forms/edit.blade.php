
<div id="edit-rating" style="display: none">
    <div class="modal-content">
        <form method="POST" action="{{ route('home.rating.edit') }}" id="edit-form">
            @csrf
            <p class="subtitle lined-title">Редагування рейтингу</p>
            <input type="text" name="id" value="" class="hidden">
            <input type="text" name="period-type-input" value="" class="hidden">
            <input type="text" name="period-input" value="" class="hidden">
            <label>
                <input type="text" name="name" placeholder="Назва заходу, події*">
            </label>
            <label>
                <input type="text" name="date" data-toggle="datepicker" placeholder="Дата проведення">
            </label>

            <div class="rating-grade">
                <p class="subtitle lined-title">Оберіть блок та пункт</p>

                @include('rating.includes.forms.select-block')
                @include('rating.includes.forms.select-punkt')

                <label class="total">
                    <span>Ваш бал за участь в заході: </span>
                    <input type="text" name="total" disabled value="0">
                </label>
            </div>
            <input type="text" name="action" class="hidden" value="{{ $actionMode }}">

            <input type="submit" class="main-btn" value="Зберегти">
        </form>
    </div>

</div>
