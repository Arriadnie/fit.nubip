<div class="container-main">
    <div class="students-wrap">
        <div class="students-images">
            @for($i = 0; $i < 2; $i++)
                <div class="students-images-column">
                    @foreach($peopleGroup->infos(4)->get() as $people)
                        @include('people-infos.groups.student-preview.item', ['people' => $people])
                    @endforeach
                </div>
            @endfor
        </div>
        <div class="students-text">
            <p class="lined-title">{{ Setting::getLocalized('main-page.our-students-preview-title') }}</p>
            <p class="students-description">
                {{ Setting::getLocalized('main-page.our-students-preview-description') }}
            </p>
            <a href="{{ url('nashi-vipuskniki') }}" class="main-btn">@lang('main.know-more')</a>
        </div>
    </div>
</div>
