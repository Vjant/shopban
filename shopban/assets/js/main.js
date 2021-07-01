$(function() {
    "use strict";

    /*---------------------------
       Commons Variables
    ------------------------------ */
    var $window = $(window),
        $body = $("body");

        
    /*---------------------
        Toggle Search Bar
    --------------------- */
    $(".search-element-wrap > a").on("click", function() {
        $(this).toggleClass('active');
        $('.search-element').slideToggle('medium');
    }); 
    /*---------------------------
       Menu Fixed On Scroll Active
    ------------------------------ */
    $(window).scroll(function() {
        var window_top = $(window).scrollTop() + 1;
        if (window_top > 250) {
            $(".sticky-nav").addClass("menu_fixed animated fadeInDown");
        } else {
            $(".sticky-nav").removeClass("menu_fixed animated fadeInDown");
        }
    });

    $('[data-bg-image]').each(function() {
        var $this = $(this),
            $image = $this.data('bg-image');
        $this.css('background-image', 'url(' + $image + ')');
    });

    /*---------------------------
       Menu menu-content
    ------------------------------ */

    $(".header-menu-vertical .menu-title").on("click", function(event) {
        $(".header-menu-vertical .menu-content").slideToggle(500);
    });

    $(".menu-content").each(function() {
        var $ul = $(this),
            $lis = $ul.find(".menu-item:gt(5)"),
            isExpanded = $ul.hasClass("expanded");
        $lis[isExpanded ? "show" : "hide"]();

        if ($lis.length > 0) {
            $ul.append(
                $(
                    '<li class="expand">' +
                    (isExpanded ? '<a href="javascript:;"><span><i class="ion-android-remove"></i>Close Categories</span></a>' : '<a href="javascript:;"><span><i class="ion-android-add"></i>More Categories</span></a>') +
                    "</li>"
                ).on("click", function(event) {
                    var isExpanded = $ul.hasClass("expanded");
                    event.preventDefault();
                    $(this).html(isExpanded ? '<a href="javascript:;"><span><i class="ion-android-add"></i>More Categories</span></a>' : '<a href="javascript:;"><span><i class="ion-android-remove"></i>Close Categories</span></a>');
                    $ul.toggleClass("expanded");
                    $lis.toggle(300);
                })
            );
        }
    });

    /*---------------------------------
        Off Canvas Function
    -----------------------------------*/
    (function() {
        var $offCanvasToggle = $(".offcanvas-toggle"),
            $offCanvas = $(".offcanvas"),
            $offCanvasOverlay = $(".offcanvas-overlay"),
            $mobileMenuToggle = $(".mobile-menu-toggle");
        $offCanvasToggle.on("click", function(e) {
            e.preventDefault();
            var $this = $(this),
                $target = $this.attr("href");
            $body.addClass("offcanvas-open");
            $($target).addClass("offcanvas-open");
            $offCanvasOverlay.fadeIn();
            if ($this.parent().hasClass("mobile-menu-toggle")) {
                $this.addClass("close");
            }
        });
        $(".offcanvas-close, .offcanvas-overlay").on("click", function(e) {
            e.preventDefault();
            $body.removeClass("offcanvas-open");
            $offCanvas.removeClass("offcanvas-open");
            $offCanvasOverlay.fadeOut();
            $mobileMenuToggle.find("a").removeClass("close");
        });
    })();

    /*----------------------------------
        Off Canvas Menu
    -----------------------------------*/
    function mobileOffCanvasMenu() {
        var $offCanvasNav = $(".offcanvas-menu, .overlay-menu"),
            $offCanvasNavSubMenu = $offCanvasNav.find(".sub-menu");

        /*Add Toggle Button With Off Canvas Sub Menu*/
        $offCanvasNavSubMenu.parent().prepend('<span class="menu-expand"></span>');

        /*Category Sub Menu Toggle*/
        $offCanvasNav.on("click", "li a, .menu-expand", function(e) {
            var $this = $(this);
            if ($this.attr("href") === "#" || $this.hasClass("menu-expand")) {
                e.preventDefault();
                if ($this.siblings("ul:visible").length) {
                    $this.parent("li").removeClass("active");
                    $this.siblings("ul").slideUp();
                    $this.parent("li").find("li").removeClass("active");
                    $this.parent("li").find("ul:visible").slideUp();
                } else {
                    $this.parent("li").addClass("active");
                    $this.closest("li").siblings("li").removeClass("active").find("li").removeClass("active");
                    $this.closest("li").siblings("li").find("ul:visible").slideUp();
                    $this.siblings("ul").slideDown();
                }
            }
        });
    }
    mobileOffCanvasMenu();

      /**********************
     * Offcanvas: User Panel
     ***********************/
    function mobileOffCanvasUserPanel() {
        var $offCanvasNav = $('.offcanvas-userpanel'),
            $offCanvasNavSubMenu = $offCanvasNav.find('.user-sub-menu');

        /*Add Toggle Button With Off Canvas Sub Menu*/
        $offCanvasNavSubMenu.parent().prepend('<span class="offcanvas__user-expand"></span>');

        /*Category Sub Menu Toggle*/
        $offCanvasNav.on('click', 'li a, .offcanvas__user-expand', function (e) {
            var $this = $(this);
            if ($this.attr('href') === '#' || $this.hasClass('offcanvas__user-expand')) {
                e.preventDefault();
                if ($this.siblings('ul:visible').length) {
                    $this.parent('li').removeClass('active');
                    $this.siblings('ul').slideUp();
                    $this.parent('li').find('li').removeClass('active');
                    $this.parent('li').find('ul:visible').slideUp();
                } else {
                    $this.parent('li').addClass('active');
                    $this.closest('li').siblings('li').removeClass('active').find('li').removeClass('active');
                    $this.closest('li').siblings('li').find('ul:visible').slideUp();
                    $this.siblings('ul').slideDown();
                }
            }
        });
    }
    mobileOffCanvasUserPanel();

    /*------------------------------
            Hero Slider
    -----------------------------------*/

    $('.hero-slider-wrapper').slick({
        infinite: true,
        slidesToShow: 1,
        arrows: false,
        slidesToScroll: 1,
        speed: 500,
        fade: true,
        cssEase: 'linear',
        dots: true,
        autoplay: true,
        autoplaySpeed: 5000,
    });


    /*------------------------------
            Thumb Category Slider
    -----------------------------------*/

    $('.thumb-category-slider').slick({
        infinite: true,
        slidesToShow: 3,
        arrows: true,
        slidesToScroll: 1,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        speed: 800,
        cssEase: 'linear',
        dots: false,
        responsive: [{
                breakpoint: 992,
                Settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 767,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 479,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });



    /*------------------------------
            Arrival Slider
    -----------------------------------*/

    $('.arrival-slider').slick({
        infinite: true,
        slidesToShow: 4,
        arrows: true,
        slidesToScroll: 1,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        speed: 800,
        cssEase: 'linear',
        dots: false,
        responsive: [{
                breakpoint: 992,
                Settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 767,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 479,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });

    /*------------------------------
          Feature Slider
    -----------------------------------*/

    $('.feature-slider-wrapper').slick({
        infinite: true,
        slidesToShow: 2,
        arrows: true,
        slidesToScroll: 1,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        speed: 800,
        cssEase: 'linear',
        dots: false,
        responsive: [{
                breakpoint: 1200,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 992,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 767,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 700,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
        ]
    });

    /*------------------------------
          Feature Slider
    -----------------------------------*/

    $('.feature-slider-wrapper-2').slick({
        infinite: true,
        slidesToShow: 2,
        arrows: true,
        slidesToScroll: 1,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        speed: 800,
        cssEase: 'linear',
        dots: false,
        responsive: [{
                breakpoint: 1200,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 992,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 767,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 700,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
        ]
    });
    /*------------------------------
              Testimonial Slider
      -----------------------------------*/

    $('.testimonial-slider-wrapper').slick({
        infinite: true,
        slidesToShow: 1,
        arrows: true,
        slidesToScroll: 1,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        loop: true,
        speed: 800,
        cssEase: 'linear',
        dots: false,
    });
    /*------------------------------
            Main Blog  Slider
    -----------------------------------*/

    $('.main-blog-slider-wrapper').slick({
        infinite: true,
        slidesToShow: 2,
        arrows: true,
        slidesToScroll: 1,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        speed: 800,
        cssEase: 'linear',
        dots: false,
        responsive: [{
                breakpoint: 1200,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 992,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 767,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 579,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
        ]
    });
    /*------------------------------
            Brand Slider
    -----------------------------------*/

    $('.brand-slider').slick({
        infinite: true,
        slidesToShow: 6,
        arrows: true,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        slidesToScroll: 1,
        speed: 800,
        cssEase: 'linear',
        dots: false,
        responsive: [{
                breakpoint: 1200,
                Settings: {
                    slidesToShow: 5,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 992,
                Settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 767,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 479,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 400,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });
    /*------------------------------
            Feature Product Slider
    -----------------------------------*/

    $('.feature-product-slider').slick({
        infinite: true,
        slidesToShow: 1,
        arrows: true,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        slidesToScroll: 1,
        speed: 800,
        cssEase: 'linear',
        dots: false,
        responsive: [{
                breakpoint: 1200,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 992,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 767,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 479,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 400,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });
    /*------------------------------
            Feature Product Slider
    -----------------------------------*/

    $('.feature-product-slider-2').slick({
        infinite: true,
        slidesToShow: 1,
        arrows: true,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        slidesToScroll: 1,
        speed: 800,
        cssEase: 'linear',
        dots: false,
        responsive: [{
                breakpoint: 1200,
                Settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 992,
                Settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 767,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 479,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
        ]
    });

    /*------------------------------
            Hot Deal Slider
    -----------------------------------*/

    $('.hot-deal-slider').slick({
        infinite: true,
        slidesToShow: 4,
        arrows: true,
        slidesToScroll: 1,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        speed: 800,
        cssEase: 'linear',
        dots: false,
        responsive: [{
                breakpoint: 1200,
                Settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 992,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 767,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 576,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 500,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });
    /*------------------------------
            Hot Deal Slider 2
    -----------------------------------*/

    $('.hot-deal-slider-2').slick({
        infinite: true,
        slidesToShow: 2,
        arrows: true,
        slidesToScroll: 1,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        speed: 800,
        cssEase: 'linear',
        dots: false,
        responsive: [{
                breakpoint: 1199,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 992,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 767,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 479,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });
    /*------------------------------
            Hot Deal Slider 3
    -----------------------------------*/

    $('.trending-slider-wrapper').slick({
        infinite: true,
        slidesToShow: 1,
        arrows: false,
        slidesToScroll: 1,
        speed: 800,
        cssEase: 'linear',
        dots: true,
        responsive: [{
                breakpoint: 992,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 767,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 479,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });
    /*------------------------------
            Quickview Slider
    -----------------------------------*/
    $('.gallery-top').slick({
        autoplay: false,
        autoplaySpeed: 1000,
        pauseOnHover: true,
        arrows: false,
        dots: false,
        infinite: true,
        fade: true,
        asNavFor: '.gallery-thumbs',
    });
    $('.gallery-thumbs').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: true,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        dots: false,
        infinite: true,
        focusOnSelect: true,
        loop: true,
        asNavFor: '.gallery-top',
    });



    /*----------------------------  
        All Category toggle  
     ------------------------------*/

    $(".category-toggle").on("click", function(e) {
        $(".category-menu").slideToggle("slow");
    });
    $(".menu-item-has-children-1").on("click", function(e) {
        $(".category-mega-menu-1").slideToggle("slow");
    });
    $(".menu-item-has-children-2").on("click", function(e) {
        $(".category-mega-menu-2").slideToggle("slow");
    });
    $(".menu-item-has-children-3").on("click", function(e) {
        $(".category-mega-menu-3").slideToggle("slow");
    });
    $(".menu-item-has-children-4").on("click", function(e) {
        $(".category-mega-menu-4").slideToggle("slow");
    });

    /*-----------------------------  
              Category more toggle  
        -------------------------------*/

    $(".category-menu li.hidden").hide();
    $("#more-btn").on("click", function(e) {
        e.preventDefault();
        $(".category-menu li.hidden").toggle(500);
        var htmlAfter = '<i class="ion-ios-minus-empty" aria-hidden="true"></i> Less Categories';
        var htmlBefore = '<i class="ion-ios-plus-empty" aria-hidden="true"></i> More Categories';

        if ($(this).html() == htmlBefore) {
            $(this).html(htmlAfter);
        } else {
            $(this).html(htmlBefore);
        }
    });

    /*---------------------
        Countdown
    --------------------- */
    $("[data-countdown]").each(function() {
        var $this = $(this),
            finalDate = $(this).data("countdown");
        $this.countdown(finalDate, function(event) {
            $this.html(event.strftime('<span class="cdown day"><span class="cdown-1">%-D</span><p>D</p></span> <span class="cdown hour"><span class="cdown-1">%-H</span><p>H</p></span> <span class="cdown minutes"><span class="cdown-1">%M</span> <p>M</p></span> <span class="cdown second"><span class="cdown-1"> %S</span> <p>S</p></span>'));
        });
    });

    /*---------------------
        Scroll Up
    --------------------- */
    $.scrollUp({
        scrollText: '<i class="ion-android-arrow-up"></i>',
        easingType: "linear",
        scrollSpeed: 900,
        animation: "fade",
    });

    /*----------------------------
        Cart Plus Minus Button
    ------------------------------ */
    var CartPlusMinus = $(".cart-plus-minus");
    CartPlusMinus.prepend('<div class="dec qtybutton">-</div>');
    CartPlusMinus.append('<div class="inc qtybutton">+</div>');
    $(".qtybutton").on("click", function(e) {
        var $button = $(this);
        var oldValue = $button.parent().find("input").val();
        if ($button.text() === "+") {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }
        $button.parent().find("input").val(newVal);
    });

    /*--------------------------
            Product Zoom
    ---------------------------- */

    var zoomOptions = {
        zoomType: "inner",
        cursor: "crosshair",
        easing: true,
        responsive: true,
    };

    $(".zoompro-wrap").slick({
        asNavFor: ".product-dec-slider-2",
        slidesToShow: 1,
        arrows: false,
        dots: false,
        fade: true,
    });
    $(".product-dec-slider-2").slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: true,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        dots: false,
        infinite: true,
        loop: true,
        asNavFor: ".zoompro-wrap",
        focusOnSelect: true
    });
    $(".zoompro-wrap .slick-current img").elevateZoom(zoomOptions);
    $(".zoompro-wrap").on("beforeChange", function(
        event,
        slick,
        currentSlide,
        nextSlide
    ) {
        $.removeData(currentSlide, "elevateZoom");
        $(".zoomContainer").remove();
    });
    $(".zoompro-wrap").on("afterChange", function(e) {
        $(".zoompro-wrap .slick-current img").elevateZoom(zoomOptions);
    });


    /*--------------------------
            Product Zoom
    ---------------------------- */

    var zoomOptions = {
        zoomType: "inner",
        cursor: "crosshair",
        easing: true,
        responsive: true,
        zoomWindowWidth: 300,
        zoomWindowHeight: 100,
    };

    $(".zoompro-wrap-2").slick({
        asNavFor: ".product-dec-slider-3",
        slidesToShow: 1,
        arrows: false,
        dots: false,
        fade: true,
    });
    $(".product-dec-slider-3").slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: true,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        dots: false,
        infinite: true,
        loop: true,
        vertical: true,
        asNavFor: ".zoompro-wrap-2",
        focusOnSelect: true
    });
    $(".zoompro-wrap-2 .slick-current img").elevateZoom(zoomOptions);
    $(".zoompro-wrap-2").on("beforeChange", function(
        event,
        slick,
        currentSlide,
        nextSlide
    ) {
        $.removeData(currentSlide, "elevateZoom");
        $(".zoomContainer").remove();
    });
    $(".zoompro-wrap-2").on("afterChange", function(e) {
        $(".zoompro-wrap-2 .slick-current img").elevateZoom(zoomOptions);
    });


    /*------------------------------
            popular Category Slider
    -----------------------------------*/

    $('.single-product-slider-active').slick({
        infinite: true,
        slidesToShow: 4,
        arrows: true,
        slidesToScroll: 1,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        speed: 800,
        cssEase: 'linear',
        dots: false,
        responsive: [{
                breakpoint: 1200,
                Settings: {
                    slidesToShow: 4,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 992,
                Settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 767,
                Settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 479,
                Settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
        ]
    });
    /*---------------------------
       Blog Gallery Slider
    ------------------------------ */

    $('.blog-gallery').slick({
        dots: false,
        infinite: true,
        arrows: true,
        prevArrow: '<span class="prev"><i class="las la-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="las la-angle-right"></i></span>',
        speed: 800,
        slidesToShow: 1,
        slidesToScroll: 1,
    });

    /*-------------------------------
        Create an account toggle
    ---------------------------------*/
    $(".checkout-toggle2").on("click", function(e) {
        $(".open-toggle2").slideToggle(1000);
    });

    $(".checkout-toggle").on("click", function(e) {
        $(".open-toggle").slideToggle(1000);
    });

    /*js ripples activation*/
    $('.js-ripples').ripples({
        resolution: 512,
        dropRadius: 20,
        perturbance: 0.04
    });



});