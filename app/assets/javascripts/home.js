$(document).ready( function() {
// $( document ).on('turbolinks:load', function() {

    // $( 'a' ).imageLightbox();

    var navHeight = $('nav').outerHeight();
    var vWidth    = $(window).width();

    $('.ui.sticky')
      .sticky({
        context: '.content-container',
        onStick: function() {
          $('.open-at').attr("style", "display: none !important");
          $('.content-container').css( "padding-top",  navHeight );
        },
        onUnstick: function() {
          $('.open-at').attr("style", "display: block !important");
          $('.content-container').css( "padding-top", 0 );
        },
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
