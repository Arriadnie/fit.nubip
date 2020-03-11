
<a href="#" class="students-images-item">
    <img src="{{ $people->getImage(true) }}" alt="">
    <div class="student-content">
        <p class="student-name">{{ $people->name }}</p>
        <p class="student-department">{{ strip_tags($people->description) }}</p>
    </div>
</a>
