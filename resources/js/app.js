import {
    createEvent,
    isExist
} from "./delta-functions";

let nextArrow = `<div class="slider-arrow slider-next">
                <svg xmlns="http://www.w3.org/2000/svg" width="15.608" height="31.217" viewBox="0 0 15.608 31.217">
                  <path id="virustotal-icon" d="M150.465,15.608,137.783,28.29v2.927l15.608-15.608L137.783,0V2.927Z" transform="translate(-137.783)" fill="#fff"/>
                </svg>
            </div>`;
let prevArrow = `<div class="slider-arrow slider-prev">
                <svg xmlns="http://www.w3.org/2000/svg" width="15.608" height="31.217" viewBox="0 0 15.608 31.217">
                  <path id="virustotal-icon" d="M150.465,15.608,137.783,28.29v2.927l15.608-15.608L137.783,0V2.927Z" transform="translate(-137.783)" fill="#fff"/>
                </svg>
            </div>`;
/*********************
 * Section import jquery and libs
 * Import examples:
 *********************/
import $ from "jquery";

require("@chenfengyuan/datepicker")

window.$ = window.jQuery = $;
require("slick-carousel");
require("@fancyapps/fancybox");
import SlimSelect from 'slim-select';

/*********************
 * Section import vanilla JS libs
 * Import examples:
 //  *********************/
import {TweenMax} from "gsap/TweenMax";
import TimelineMax from "gsap/TimelineMax";
// import ScrollToPlugin from "gsap/ScrollToPlugin"

document.addEventListener('DOMContentLoaded', function(e) {
    loadAndResize();

    isExist('.file-label', (filesInput) => {
        filesInput.forEach((label) => {
            let input = label.querySelector('input');
            let defaultText = label.getAttribute('data-placeholder');
            let placeholder = label.querySelector('.placeholder')
            input.addEventListener("change", function (event) {
                placeholder.innerHTML = this.value !== '' ? this.value : defaultText;
            });
        })
    });

    isExist('.main-slider', () => {
        let slider = document.querySelector('.main-slider');

        $(slider)
            .on('setPosition', function (slick) {
                let height = slider.getBoundingClientRect().height;
                slider.querySelectorAll('.slick-slide').forEach((slide) => {
                    slide.style.height = height + 'px';
                });
            })
            .on('init', function (slick) {
                let loadTl = new TimelineMax({
                    delay: 0,
                    onComplete: function () {
                        let slide = slider.querySelector(`[data-slick-index='0']`);
                        animateMainSlide(slide)
                    }
                });
                loadTl.to(slider, 1, {opacity: 1});

            })
            .on('beforeChange', function (event, slick, currentSlide, nextSlide) {

                let nextSlideItem = slider.querySelector(`[data-slick-index='${nextSlide}']`);
                setOpacitySlide(nextSlideItem)
            })
            .on('afterChange', function (event, slick, currentSlide, nextSlide) {
                let slide = slider.querySelector(`[data-slick-index='${currentSlide}']`);
                animateMainSlide(slide);
            })
            .slick({
                slidesToShow: 1,
                dragable: false,
                slidesToScroll: 1,
                infinite: true,
                autoplay: true,
                autoplaySpeed: 5000,
                speed: 500,
                prevArrow: prevArrow,
                nextArrow: nextArrow,
                dots: true,
                customPaging: function (slider, i) {
                    return '<a class="custom-pagination"> </a>'
                }
            });
    });

    isExist('.course-slider', () => {
        let sliders = document.querySelectorAll('.course-slider');
        sliders.forEach((slider) => {
            $(slider).slick({
                slidesToShow: 3,
                dragable: false,
                slidesToScroll: 1,
                infinite: false,
                autoplay: false,
                speed: 500,
                prevArrow: prevArrow,
                nextArrow: nextArrow

            });
        })

    });

    isExist('.gallery', () => {
        $('.gallery').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            infinite: true,
            speed: 500,
            prevArrow: prevArrow,
            nextArrow: nextArrow

        })
    })

    isExist('.partners-slider', () => {
        $('.partners-slider').slick({
            slidesToShow: 4,
            slidesToScroll: 1,
            infinite: true,
            autoplay: true,
            autoplaySpeed: 3000,
            speed: 500,
            prevArrow: prevArrow,
            nextArrow: nextArrow

        })
    });

    isExist('.login-page', () => {
        let btnGoLogin = document.querySelector('.login-page .go-login');
        let btnGoRegister = document.querySelector('.login-page .go-register');
        let decoration = document.querySelector('.auth-image-container');

        let loginForm= document.querySelector('.login-block');
        let registerForm = document.querySelector('.register-block');

        let openLogin = new TimelineMax({
            paused: true
        });
        openLogin
            .to(decoration, 0.5, {left: '0'})
            .fromTo( loginForm, 0.4,  {opacity: 1, x: '0%'}, {opacity: 0, x: '10%'}, 0)
            .fromTo(registerForm, 0.4, {opacity: 0, x: '-10%'}, {opacity: 1, x: '0%'}, 0.3)

        btnGoRegister.addEventListener('click', function(e) {
            e.preventDefault();
            openLogin.play();
        });
        btnGoLogin.addEventListener('click', function(e) {
            e.preventDefault();
            openLogin.reverse();
        })
    });

    isExist('[data-toggle-btn]', () => {
        document.querySelectorAll('[data-toggle-btn]').forEach((btn) => {
            btn.addEventListener('click', function (e) {
                e.preventDefault();
                gsapToggleHeight(btn);
            })

        })
    });

    isExist('[data-href]', () => {
        if (window.location.hash) {

            let hash = window.location.hash;
            if (document.querySelector(`[data-id="${hash}"]`)) {
                document.querySelector(`[data-id="${hash}"]`).classList.add('active');
                document.querySelector(`[data-href="${hash}"]`).classList.add('active');

            } else {
                document.querySelector(`[data-id]`).classList.add('active');
                document.querySelector(`[data-href]`).classList.add('active');
            }
            history.pushState('', '', location.origin + location.pathname);
        } else {
            document.querySelector(`[data-id]`).classList.add('active');
            document.querySelector(`[data-href]`).classList.add('active');
        }

        document.querySelectorAll('[data-href]').forEach((link) => {
            link.addEventListener('click', function (e) {

                let href = this.getAttribute('data-href');
                let visibleBlocks = document.querySelectorAll('.active[data-id]');

                if (visibleBlocks) {
                    visibleBlocks.forEach((visibleBlock) => {
                        visibleBlock.classList.remove('active')
                    });
                }
                this.parentElement.classList.add('active');

                document.querySelector(`[data-id="${href}"]`).classList.add('active');
            })
        })
    });

    isExist('.show-notifications', () => {
        let events = document.querySelector('.personal-events');
        document.querySelector('.show-notifications').addEventListener('click', function (e) {
            this.classList.remove('active')
            if (events) {
                if (events.classList.contains('active')) {
                    events.classList.remove('active')
                } else {
                    events.classList.add('active')
                }
            }

        });
    });

    isExist('.add-personal-info', () => {
        let btn = document.querySelector('.add-personal-info .enable-input');
        let form = document.querySelector('.add-personal-info form');
        let inputs = form.querySelectorAll('input:not([type=submit]), textarea');

        btn.addEventListener('click', function (e) {
            e.preventDefault();
            if (btn.classList.contains('disabled')) {
                btn.classList.remove('disabled');
                btn.innerText = 'Зберегти інформацію';
                inputs.forEach((item) => {
                    item.removeAttribute('disabled')
                })
            } else {
                form.submit();
                btn.classList.add('disabled');
                btn.innerText = 'Редагувати інформацію';
                inputs.forEach((item) => {
                    item.setAttribute('disabled', 'true')
                });


            }
        })

    });

    isExist('select.default-select', (selects) => {

        selects.forEach((select) => {
            let serach = select.getAttribute('data-search');
            new SlimSelect({
                select: select,
                showSearch: serach ? true : false,
                // allowDeselectOption: true,
            })
        });


    });

    $('[data-toggle="datepicker"]').datepicker({
        format: 'dd.mm.yyyy'
    });

    ratingSelectEvents();

    isExist('.schedule-filter .switch-wrap', () => {

        let wrap = document.querySelector('.schedule-filter .switch-wrap');
        let radio = wrap.querySelector('input[type="checkbox"]');
        checkboxToggleTable();

        radio.addEventListener('change', function(e) {
            checkboxToggleTable();
        })

    });

    isExist('.server-notification-item', (list) => {
        setTimeout(() => {
            TweenMax.staggerTo('.server-notification-item', 0.9, { opacity: 0, x: '100%', stagger: 0.3,
                onComplete() {
                    document.querySelector('.server-notification-wrap').style.display = 'none'
                }})
        }, 5000)
    })

    isExist('[data-synchronize]', (synchronized) => {
        synchronized.forEach((firstSelect) => {
            let data = JSON.parse(firstSelect.getAttribute('data-synchronize'));
            let secondSelect = document.querySelector(`[name="${data['select-name']}"]`);
            let dataToSet = window[data.data];
            if (secondSelect && dataToSet) {
                firstSelect.addEventListener('change', function() {
                    let value = firstSelect.slim.selected();
                    secondSelect.slim.setData(dataToSet[`${data.search}${value}`])
                });
            }

        });

    })

});


function checkboxToggleTable() {
    let wrap = document.querySelector('.schedule-filter .switch-wrap');
    let radio = wrap.querySelector('input[type="checkbox"]');
    let rightP = wrap.querySelector('p.right');
    let leftP = wrap.querySelector('p.left');
    let topTable = document.querySelector('.table-wrap.top');
    let bottomTable = document.querySelector('.table-wrap.bottom');

    if (radio.checked) {
        rightP.classList.add('active')
        leftP.classList.remove('active')
        topTable.classList.remove('visible')
        bottomTable.classList.add('visible')
    } else {
        leftP.classList.add('active')
        rightP.classList.remove('active')
        topTable.classList.add('visible')
        bottomTable.classList.remove('visible')
    }
}

window.addEventListener('resize', function (e) {
    loadAndResize();
});

window.addEventListener('scroll', function (e) {
    isExist('.statistic-wrap', () => {
        let wrapper = document.querySelector('.statistic-wrap');
        let a = 0;

        let oTop = $(wrapper).offset().top - window.innerHeight;

        if (a === 0 && $(window).scrollTop() > oTop) {
            $('.statistic-number').each(function () {
                let $this = $(this),
                    countTo = $this.attr('data-count');
                $({
                    countNum: $this.text()
                }).animate({
                        countNum: countTo
                    },
                    {
                        duration: 900,
                        easing: 'linear',
                        step: function () {
                            $this.text(Math.floor(this.countNum));
                        },
                        complete: function () {
                            $this.text(this.countNum);
                            //alert('finished');
                        }

                    });
            });
            a = 1;
        }

    });

    isExist('header', () => {
        let header = document.querySelector('header')
        if (window.scrollY > 10) {
            if (!header.classList.contains('scrolled')) {
                header.classList.add('scrolled')
            }
        } else {
            if (header.classList.contains('scrolled')) {
                header.classList.remove('scrolled')
            }
        }
    })


});



global.callModal = function (event, text) {
    event.preventDefault();
    let classList = event.target.classList;
    let data = event.target.parentElement.getAttribute('data-item')

    let modalTemplate = `
    <div class="modal">
        <div class="modal-content">
            <p>${text}</p>
            <div class="modal-btn">
                <a href="#" class="main-btn modal-confirm">Підтвердити</a>
                <a href="#" class="main-btn light" onclick="$.fancybox.close();">Відмінити</a>
            </div>
       </div>
    </div>`;

    if (classList.contains('confirm')) {
        $.fancybox.open(
            modalTemplate,
            {
                afterShow: function (instance, current) {
                    document.querySelector('.modal.fancybox-content .modal-confirm').addEventListener('click', function (e) {
                        e.preventDefault();

                    })
                }
            })

    } else if (classList.contains('delete')) {
        $.fancybox.open(
            modalTemplate,
            {
                afterShow: function (instance, current) {
                    document.querySelector('.modal.fancybox-content .modal-confirm').addEventListener('click', function (e) {
                        e.preventDefault();
                    })
                }
            })

    } else if (classList.contains('change')) {
        $.fancybox.open({
            src: '#edit-rating',
            type: 'inline',
            opts: {
                afterShow: function (instance, current) {
                    let form = document.querySelector('#edit-rating');
                    data = JSON.parse(data)
                    for (let key in data) {
                        let input = document.querySelector(`input[name=${key}]`);
                        let select = document.querySelector(`select[name=${key}]`);
                        if (input) {
                            input.setAttribute('value', data[key]);
                        } else if (select) {
                            select.slim.set(data[key])
                        }

                    }
                }
            }
        });
    } else if (classList.contains('deny')) {
        $.fancybox.open({
            src: '#deny-rating',
            type: 'inline',
        });
    }

};

function ratingSelectEvents() {
    let wrap = document.querySelector('.rating-grade');
    if (!wrap) return;

    let blockSelect = wrap.querySelector('select[name="block"]');
    let punktSelect = wrap.querySelector('select[name="punkt"]');
    let total = wrap.querySelector('input[name="total"]');


    if (blockSelect.slim && punktSelect.slim) {

        blockSelect.addEventListener('change', function () {
            let block = blockSelect.slim.selected();
            let data = window.rating_blocks[`block_${block}`];
            if (data) {
                let placeholder = {
                    "text": "Оберіть пункт ",
                    "value": "",
                    placeholder: true
                };
                data.unshift(placeholder);
                punktSelect.slim.setData(data)
                total.setAttribute('value', '0')
            }
        });

        punktSelect.addEventListener('change', function () {
            let block = blockSelect.slim.selected();
            let data = window.rating_blocks[`block_${block}`];

            let punktId = punktSelect.slim.selected();

            let punkt = data.find(item => item.value === punktId);
            total.setAttribute('value', punkt.bal)
        })


    }


}

function loadAndResize() {
    let headerHeight = document.querySelector('header').getBoundingClientRect().height;
    if (document.querySelector('.personal-menu')) {
        document.querySelector('.personal-menu').style.top = headerHeight + 'px';
        headerHeight += document.querySelector('.personal-menu').getBoundingClientRect().height;
    }
    isExist('.main-slider', () => {
        document.querySelector('.main-slider').style.height = window.innerHeight - headerHeight + 'px';
    });

    isExist('main', () => {
        document.querySelector('main').style.paddingTop = headerHeight + 'px';
        document.querySelector('main').style.minHeight = window.innerHeight - headerHeight + 'px';

    });

    isExist('.personal-events', () => {
        let personalEvents = document.querySelector('.personal-events');

        personalEvents.style.top = headerHeight + 'px';
        personalEvents.style.height = window.innerHeight - headerHeight + 'px';

    });


}

function setOpacitySlide(slide) {
    let title = slide.querySelector('.slide-heading');
    if (title) {
        title.style.opacity = 0;
    }

    let text = slide.querySelector('.slide-text');
    if (text) {
        text.style.opacity = 0;
    }

    let btn = slide.querySelector('.main-btn');
    if (btn) {
        btn.style.opacity = 0;
    }

}

function animateMainSlide(slide) {
    let title = slide.querySelector('.slide-heading');
    if (title) {
        TweenMax.fromTo(title, 0.6, {opacity: 0, x: '-40%'}, {opacity: 1, x: '0%'})
    }
    let text = slide.querySelector('.slide-text');
    if (text) {
        TweenMax.fromTo(text, 0.6, {opacity: 0, y: '50%'}, {opacity: 1, y: '0%'})
    }

    let btn = slide.querySelector('.main-btn');
    if (btn) {
        TweenMax.fromTo(btn, 0.6, {opacity: 0, y: '50%'}, {opacity: 1, y: '0%'})
    }

}

function gsapToggleHeight(button, speed = 0.4, delayT = 0, height = 'auto') {
    let dataBtn = button.getAttribute('data-toggle-btn');
    let elem = document.querySelector(`[data-toggle-block="${dataBtn}"]`);

    //In case we need to toggle elements with the same data-toggle attribute. Search elem from this element's parent.

    if (!button || !elem) return;
    if (!button.classList.contains('closed')) {
        TweenMax.set(elem, {height: height, opacity: 1});
        TweenMax.to(elem, 0.4, {height: 0, opacity: 0, ease: Power0.easeNone, delay: delayT});
        button.classList.add("closed");
    } else {

        TweenMax.set(elem, {height: height, opacity: 1});
        TweenMax.from(elem, 0.4, {height: 0, opacity: 0, ease: Power0.easeNone});
        button.classList.remove("closed");
    }

}
