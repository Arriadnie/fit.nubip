

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

window.$ = window.jQuery = $;
require("slick-carousel");
// require("@fancyapps/fancybox");

/*********************
 * Section import vanilla JS libs
 * Import examples:
 //  *********************/
import {TweenMax} from "gsap/TweenMax";
import TimelineMax from "gsap/TimelineMax";
// import ScrollToPlugin from "gsap/ScrollToPlugin"


window.addEventListener('load', function(e) {
    loadAndResize();

    isExist('.main-slider', () => {
        let slider = document.querySelector('.main-slider');

        $(slider)
            .on('setPosition', function(slick) {
                let height = slider.getBoundingClientRect().height;
                slider.querySelectorAll('.slick-slide').forEach((slide) => {
                    slide.style.height = height + 'px';
                });
            })
            .on('init', function(slick){
                let loadTl = new TimelineMax({
                    delay: 0,
                    onComplete: function() {
                        let slide = slider.querySelector(`[data-slick-index='0']`);
                        animateMainSlide(slide)
                    }
                });
                loadTl.to(slider, 1, {opacity: 1});

            })
            .on('beforeChange', function(event, slick, currentSlide, nextSlide) {

                let nextSlideItem = slider.querySelector(`[data-slick-index='${nextSlide}']`);
                setOpacitySlide(nextSlideItem)
            })
            .on('afterChange', function(event, slick, currentSlide, nextSlide) {
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
                customPaging: function(slider, i) {
                    return '<a class="custom-pagination"> </a>'
                }
            });
    });

    isExist('.course-slider', () => {
        let slider = document.querySelector('.course-slider');
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
    });

});

window.addEventListener('resize', function(e) {
    loadAndResize();
});

window.addEventListener('scroll', function(e) {
    isExist('.statistic-wrap', () => {
        let wrapper = document.querySelector('.statistic-wrap');
        let a = 0;

            let oTop = $(wrapper).offset().top - window.innerHeight;
        console.log(oTop, $(wrapper).offset().top)

            if (a == 0 && $(window).scrollTop() > oTop) {
                $('.statistic-number').each(function() {
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
                            step: function() {
                                $this.text(Math.floor(this.countNum));
                            },
                            complete: function() {
                                $this.text(this.countNum);
                                //alert('finished');
                            }

                        });
                });
                a = 1;
            }

        });

});


function loadAndResize() {
    let headerHeight = document.querySelector('header').getBoundingClientRect().height;
    isExist('.main-slider', () => {
        document.querySelector('.main-slider').style.height = window.innerHeight - headerHeight + 'px';
    });

    isExist('main', () => {
        document.querySelector('main').style.paddingTop = headerHeight + 'px';
    })

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
        TweenMax.fromTo(btn, 0.6, {opacity: 0, y: '50%'}, {opacity: 1,  y: '0%'})
    }

}

