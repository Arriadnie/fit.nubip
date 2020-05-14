
<a href="{{ url('nashi-vipuskniki') }}" class="students-images-item">
    <img src="{{ $people->getImage(true) }}" alt="">
    <div class="student-content">
        <p class="student-name">{{ $people->getTranslatedAttribute('name') }}</p>
        <p class="student-department">{{ strip_tags($people->getTranslatedAttribute('description')) }}</p>
    </div>
</a>
