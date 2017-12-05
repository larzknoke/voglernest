$(document).ready( function() {
    // $( 'a' ).imageLightbox();

  console.log('MOEP!')
  // var isDesktop = typeof window.orientation === 'undefined';
  //   if (isDesktop) {
  //     // Add body hook for device specific styles
  //     $('body').addClass('desktop');
  //     $(window).bind('scroll', function () {
  //         if ($(window).scrollTop() > 349) {
  //             $('#nav').addClass('fixed');
  //             $('.first-section').css( "margin-top", "406px" );
  //             $('.open-at').hide();
  //         } else {
  //             $('#nav').removeClass('fixed');
  //             $('.first-section').css( "margin-top", "349px" );
  //             $('.open-at').show();
  //         }
  //     });
  //   } else {
  //     $('body').addClass('device ');
  //         $('#head').css( "position", "absolute" );
  //         $('.bioland').css( "position", "absolute" );
  //   }

    var navHeight = $('nav').outerHeight();

    $('.ui.sticky')
      .sticky({
        context: '.content-container',
        onStick: function() {
          $('.open-at').hide();
          $('.content-container').css( "padding-top",  navHeight );
        },
        onUnstick: function() {
          $('.open-at').show();
          $('.content-container').css( "padding-top", 0 );
        },
    });

    jQuery(document).on('turbolinks:load', function() {
      return $('#carousel').slick({
          infinite: true,
          slidesToShow: 1,
          slidesToScroll: 1,
          dots: false,
          arrows: true,
          // autoplay: true,
          // autoplaySpeed: 4000,
          adaptiveHeight: true,
          prevArrow: '<button type="button" class="slick-prev"></button>',
          nextArrow: '<button type="button" class="slick-next"></button>'
      });
    });


    $('.img-holder').mouseenter(function(){
      $('.img-item').removeClass('hover');
    }).mouseleave(function(){
      // $( ".img-item" ).first().addClass( "hover" );
    });


  });
