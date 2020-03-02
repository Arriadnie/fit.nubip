
<div class="student-item">
    <div class="student-image">
        <img src="{{ $people->getImage(true) }}" alt="">
    </div>
    <div class="student-info">
        <p class="student-name">{{ $people->name }}</p>
        <p class="student-about">{{ strip_tags($people->description) }}</p>
        <div class="student-contact">
            @foreach(App\Models\SocialNetwork::all() as $network)
                <a href="{{ $network->link }}" target="_blank" class="student-contact-item">
                    <img src="{{ $network->getImage(true) }}" alt="">
                </a>
            @endforeach
        </div>
    </div>
</div>
