$(document).ready( function() {
// $( document ).on('turbolinks:load', function() {

    // $( 'a' ).imageLightbox();

    var vWidth        = $(window).width();
    var nav           = $('.stick-top')
    var navHeight     = nav.outerHeight();
    var headerHeight  = $('#head').outerHeight();
    var openAt        = $('.open-at');
    var contentCont   = $('.content-container');


    $('.agree').click(function(){
      $('.cookie-notice').slideToggle(300,function(){$(this).remove()});
      Cookies.set('cookieAccept', true, { expires: 7 });
    });

    if (Cookies.get('cookieAccept')) {
      $('.cookie-notice').remove();
    }

    $(window).scroll(function(){
        if( $(window).scrollTop() > headerHeight ) {
            nav.css({position: 'fixed', top: '0px'});
            openAt.attr("style", "display: none !important");
            contentCont.css( "padding-top",  navHeight );
            nav.addClass('box-shadow')
        } else {
            nav.css({position: 'relative', top: '220px'});
            openAt.attr("style", "display: block !important");
            contentCont.css( "padding-top", 0 );
            nav.removeClass('box-shadow')
        }
    });

    $('#carousel').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: false,
        arrows: true,
        autoplay: true,
        autoplaySpeed: 4000,
        adaptiveHeight: true,
        prevArrow: '<button type="button" class="slick-prev"></button>',
        nextArrow: '<button type="button" class="slick-next"></button>'
    });

    $('#carousel2').slick({
        prevArrow: '<button type="button" class="slick-prev"></button>',
        nextArrow: '<button type="button" class="slick-next"></button>'
    });


    $('.img-holder').mouseenter(function(){
      $('.img-item').removeClass('hover');
    }).mouseleave(function(){
      // $( ".img-item" ).first().addClass( "hover" );
    });


  });
