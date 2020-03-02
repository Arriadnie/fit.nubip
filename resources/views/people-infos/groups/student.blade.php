
<div class="students-list">
    @foreach($peopleGroup->infos as $people)
        @include('people-infos.student', ['people' => $people])
    @endforeach
</div>
