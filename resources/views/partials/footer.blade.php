<footer>
    <div class="footer-logo">
        <div class="footer-logo-img">
            <img src="{{ url('storage/' . setting('site.logo')) }}" alt="">
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
                <a href="tel^" class="contact-text">+380 11 11 12 111</a>
            </div>

            <div class="contact-item">
                <div class="contact-icon">
                    <svg><use xlink:href="#mail"></use></svg>
                </div>
                <a  class="contact-text">mailezmaple@it.nules.com</a>
            </div>

            <div class="contact-item">
                <div class="contact-icon">
                    <svg><use xlink:href="#pin"></use></svg>
                </div>
                <a  class="contact-text">Київ, вул Героїв Оборони 15</a>
            </div>
        </div>
        <div class="socials-list">
            <a href="#">
                <svg><use xlink:href="#instagram"></use></svg>
            </a>
            <a href="#">
                <svg><use xlink:href="#facebook"></use></svg>
            </a>
        </div>
    </div>

    <div class="copyright">
        <p>@2020 All rights reserved</p>
        <p>Created by Altair</p>
    </div>

</footer>
