<footer>
    <div class="footer-logo">
        <div class="footer-logo-img">
            <img src="{{ Storage::disk(config('voyager.storage.disk'))->url(setting('site.logo')) }}" alt="">
        </div>
        <div class="footer-logo-text">
            <p class="university">{{ setting('site.university-name') }}</p>
            <p class="department">{{ setting('site.department-name') }}</p>
        </div>
    </div>

    <div class="footer-contacts">
        <div class="contact-list">
            <div class="contact-item">
                <div class="contact-icon">
                    <svg><use xlink:href="#phone"></use></svg>
                </div>
                @foreach(explode(',', setting('contacts.mobile-phone')) as $phone)
                    <a href="tel^{{ $phone }}" class="contact-text">{{ $phone }}</a>
                @endforeach
            </div>

            <div class="contact-item">
                <div class="contact-icon">
                    <svg><use xlink:href="#mail"></use></svg>
                </div>
                @foreach(explode(',', setting('contacts.email')) as $email)
                    <a class="contact-text">{{ $email }}</a>
                @endforeach
            </div>

            <div class="contact-item">
                <div class="contact-icon">
                    <svg><use xlink:href="#pin"></use></svg>
                </div>
                <a href="{{ setting('contacts.address-map-link') }}" class="contact-text" target="_blank">
                    {{ setting('contacts.address') }}
                </a>
            </div>
        </div>
        <div class="socials-list">
            @foreach(App\Models\SocialNetwork::all() as $network)
                <a href="{{ $network->link }}" target="_blank">
                    <img src="{{ Storage::disk(config('voyager.storage.disk'))->url(json_decode($network->svg)[0]->download_link) }}" alt="">
                </a>
            @endforeach
        </div>
    </div>

    <div class="copyright">
        <p>@ {{ date('Y') }} All rights reserved</p>
        <p>Created by Altair</p>
    </div>

</footer>
