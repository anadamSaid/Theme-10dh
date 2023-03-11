/**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 */
import $ from 'jquery';
import prestashop from 'prestashop';
import ProductSelect from './components/product-select';
$(document).ready(() => {
  // page title flashing
	prestashop.on(
		'updateCart',
		function (event) {
			$('.scart-pc').text('('+prestashop.cart.products_count+')');
		}
	);
	prestashop.on(
		'updateProduct',
		function (event) {
      if(event.event.target.className === "input-color"){
        window.scrollTo({ top: 0, behavior: 'smooth' });
      }
		}
	);
// end page title flashing
$(".slider-single").on('init', function(event, slick){
  $('.slick-slide img').addClass("showafterload");
});
$(".slider-single5").on('init', function(event, slick){
  $('.slick-slide a').addClass("showafterload");
});
$(".slider-single6").on('init', function(event, slick){
  $('.slider-single6 a').addClass("showafterload");
});
$(".slider-nav").on('init', function(event, slick){
  $('.slick-slide img').addClass("showafterload");
});
  $(".slider-single").slick({
    centerMode: true,
    centerPadding: '20px',
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: true,
    infinite:false,
    fade: false,
    useTransform: true,
    asNavFor: ".slider-nav"
  });
  $(".slider-nav").slick({
    slidesToShow: 5,
    slidesToScroll: 1,
    asNavFor: ".slider-single",
    dots: false,
    infinite:false,
    arrows: false,
    focusOnSelect: true
  });
  $(".slider-single6").slick({
    dots: false,
    infinite: false,
    speed: 300,
    slidesToShow: 4,
    slidesToScroll: 4,
    responsive: [
        {
        breakpoint: 1024,
        settings: {
            slidesToShow: 3,
            slidesToScroll: 3,
            infinite: true,
            dots: false
        }
        },
        {
        breakpoint: 600,
        settings: {
            slidesToShow: 2,
            slidesToScroll: 2
        }
        },
        {
        breakpoint: 480,
        settings: {
            slidesToShow: 2,
            slidesToScroll: 2
        }
        }
    ]
  });
  $(".slider-single5").slick({
    dots: false,
    infinite: true,
    // speed: 300,
    slidesToShow: 5,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2000,
    pauseOnHover: true,
    cssEase: 'linear',
    responsive: [
        {
        breakpoint: 1024,
        settings: {
            slidesToShow: 3,
            slidesToScroll: 1,
            infinite: true,
            dots: false
        }
        },
        {
        breakpoint: 600,
        settings: {
            slidesToShow: 2,
            slidesToScroll: 1
        }
        },
        {
        breakpoint: 480,
        settings: {
            slidesToShow: 2,
            slidesToScroll: 1
        }
        }
    ]
  });
  $("#cqty-remove").click(function() {
    if(($("#quantity_wanted").val())*1>1){
        $("#quantity_wanted").val(($("#quantity_wanted").val())*1-1)
        $("#cqinp").val($("#quantity_wanted").val())
        }
    });
$("#cqty-add").click(function() {
    $("#quantity_wanted").val(($("#quantity_wanted").val())*1+1)
    $("#cqinp").val($("#quantity_wanted").val())
    });

$("#quantity_wanted").change(function(){
    $("#cqinp").val($("#quantity_wanted").val())
});
  $('#menu-icon').on('click', () => {
    $('#mobile_top_menu_wrapper').toggleClass("drawer_open");
    $('body').toggleClass('drawer-is-open');
    $('.overlay-backdrop').show();
  });
  $('.overlay-backdrop').on('click', () => {
    $('#mobile_top_menu_wrapper').toggleClass("drawer_open");
    $('body').toggleClass('drawer-is-open');
    if ($('#mobile_top_menu_wrapper').is(':visible')) {
      $('.overlay-backdrop').hide();
    }
  });
  $('.drawer-close-button').on('click', () => {
    $('#mobile_top_menu_wrapper').toggleClass("drawer_open");
    $('body').toggleClass('drawer-is-open');
    if ($('#mobile_top_menu_wrapper').is(':visible')) {
      $('.overlay-backdrop').hide();
    }
  });
  function coverImage() {
    const productCover = $(prestashop.themeSelectors.product.cover);
    let thumbSelected = $(prestashop.themeSelectors.product.selected);

    const swipe = (selectedThumb, thumbParent) => {
      const newSelectedThumb = thumbParent.find(prestashop.themeSelectors.product.thumb);

      $(prestashop.themeSelectors.product.modalProductCover).attr('src', newSelectedThumb.data('image-large-src'));
      selectedThumb.removeClass('selected');
      newSelectedThumb.addClass('selected');
      productCover.prop('src', newSelectedThumb.data('image-medium-src'));
    };

    $(prestashop.themeSelectors.product.thumb).on('click', (event) => {
      thumbSelected = $(prestashop.themeSelectors.product.selected);
      swipe(thumbSelected, $(event.target).closest(prestashop.themeSelectors.product.thumbContainer));
    });

    productCover.swipe({
      swipe: (event, direction) => {
        thumbSelected = $(prestashop.themeSelectors.product.selected);
        const parentThumb = thumbSelected.closest(prestashop.themeSelectors.product.thumbContainer);

        if (direction === 'right') {
          if (parentThumb.prev().length > 0) {
            swipe(thumbSelected, parentThumb.prev());
          } else if (parentThumb.next().length > 0) {
            swipe(thumbSelected, parentThumb.next());
          }
        } else if (direction === 'left') {
          if (parentThumb.next().length > 0) {
            swipe(thumbSelected, parentThumb.next());
          } else if (parentThumb.prev().length > 0) {
            swipe(thumbSelected, parentThumb.prev());
          }
        }
      },
      allowPageScroll: 'vertical',
    });
  }

  function imageScrollBox() {
    if ($('#main .js-qv-product-images li').length > 2) {
      $('#main .js-qv-mask').addClass('scroll');
      $('.scroll-box-arrows').addClass('scroll');
      $('#main .js-qv-mask').scrollbox({
        direction: 'h',
        distance: 113,
        autoPlay: false,
      });
      $('.scroll-box-arrows .left').click(() => {
        $('#main .js-qv-mask').trigger('backward');
      });
      $('.scroll-box-arrows .right').click(() => {
        $('#main .js-qv-mask').trigger('forward');
      });
    } else {
      $('#main .js-qv-mask').removeClass('scroll');
      $('.scroll-box-arrows').removeClass('scroll');
    }
  }

  function createInputFile() {
    $(prestashop.themeSelectors.fileInput).on('change', (event) => {
      const target = $(event.currentTarget)[0];
      const file = (target) ? target.files[0] : null;

      if (target && file) {
        $(target).prev().text(file.name);
      }
    });
  }

  function createProductSpin() {
    const $quantityInput = $(prestashop.selectors.quantityWanted);

    $quantityInput.TouchSpin({
      // verticalbuttons: true,
      // verticalupclass: 'material-icons touchspin-up',
      // verticaldownclass: 'material-icons touchspin-down',
      // buttondown_class: 'btn btn-touchspin js-touchspin',
      // buttonup_class: 'btn btn-touchspin js-touchspin',
      min: parseInt($quantityInput.attr('min'), 10),
      max: 1000000,
    });

    $(prestashop.themeSelectors.touchspin).off('touchstart.touchspin');

    $quantityInput.focusout(() => {
      if ($quantityInput.val() === '' || $quantityInput.val() < $quantityInput.attr('min')) {
        $quantityInput.val($quantityInput.attr('min'));
        $quantityInput.trigger('change');
      }
    });

    $('body').on('change keyup', prestashop.selectors.quantityWanted, (e) => {
      if ($quantityInput.val() !== '') {
        $(e.currentTarget).trigger('touchspin.stopspin');
        prestashop.emit('updateProduct', {
          eventType: 'updatedProductQuantity',
          event: e,
        });
      }
    });
  }

  function addJsProductTabActiveSelector() {
    const nav = $(prestashop.themeSelectors.product.tabs);
    nav.on('show.bs.tab', (e) => {
      const target = $(e.target);
      target.addClass(prestashop.themeSelectors.product.activeNavClass);
      $(target.attr('href')).addClass(prestashop.themeSelectors.product.activeTabClass);
    });
    nav.on('hide.bs.tab', (e) => {
      const target = $(e.target);
      target.removeClass(prestashop.themeSelectors.product.activeNavClass);
      $(target.attr('href')).removeClass(prestashop.themeSelectors.product.activeTabClass);
    });
  }

  createProductSpin();
  createInputFile();
  coverImage();
  imageScrollBox();
  addJsProductTabActiveSelector();
  prestashop.on('updatedProduct', (event) => {
    createInputFile();
    coverImage();
    if (event && event.product_minimal_quantity) {
      const minimalProductQuantity = parseInt(event.product_minimal_quantity, 10);
      const quantityInputSelector = prestashop.selectors.quantityWanted;
      const quantityInput = $(quantityInputSelector);

      // @see http://www.virtuosoft.eu/code/bootstrap-touchspin/ about Bootstrap TouchSpin
      quantityInput.trigger('touchspin.updatesettings', {
        min: minimalProductQuantity,
      });
    }
    imageScrollBox();
    $($(prestashop.themeSelectors.product.activeTabs).attr('href')).addClass('active').removeClass('fade');
    $(prestashop.themeSelectors.product.imagesModal).replaceWith(event.product_images_modal);

    const productSelect = new ProductSelect();
    productSelect.init();
  });
  $('.showmorecap').on('click', function(evt) {
    var currentcapelem = $(this).data("cap");
    $("#"+currentcapelem).toggleClass("iscapt");
    $(this).children(".showmoretext").toggle();
    $(this).children(".showlesstext").toggle();
    $(this).children(".showmoresvg").toggle();
    $(this).children(".showlesssvg").toggle();
});
$(".arrowright").click(function() {
  var box = $(this).prev(".top-menu-dv");
    box.animate({
      scrollLeft: ((450) + box.scrollLeft()),
    })
});
$(".arrowleft").click(function() {
  var box = $(this).next(".top-menu-dv");
    box.animate({
      scrollLeft: -(((450)) - box.scrollLeft()),
    })
});
$(document).ready(function() {


    //owlCarrosel of product that are -10dh
    var owl10dh = $('#products_10dh .owl-carousel');
    owl10dh.owlCarousel({
        loop: true,
        margin:10,
        nav:false,
        autoplay: true,
        rewind: true,
        autoplayHoverPause: true,
        slideSpeed: 0,
        //autoplayTimeout: 1000, 
        responsive:{
            0:{
              items:1
              },
            420:{
              items:2
              },
            600:{
              items:3
              },
            992:{
              items:4
              },
            1200:{
              items:5
              },
        }
    });
    owl10dh.on('changed.owl.carousel', function(event) {
        var currentItem = event.item.index;
        var totalItems = event.item.count;
        // console.log(currentItem);
        // Disable next button if on last item
        if (currentItem >= totalItems) {
          document.querySelector(".Move_Products #next_btn_10dh").classList.add("swiper-button-disabled");
          setTimeout(() => {
            owl10dh.trigger('to.owl.carousel', [0, 500, true]);   
          }, 500);
        } else {
          document.querySelector(".Move_Products #next_btn_10dh").classList.remove("swiper-button-disabled");
        }
        // Disable prev button if on first item
        if (currentItem <= 5) {
          document.querySelector(".Move_Products #prev_btn_10dh").classList.add("swiper-button-disabled");
        } else {
          document.querySelector(".Move_Products #prev_btn_10dh").classList.remove("swiper-button-disabled");
        }
      });
    $('#next_btn_10dh').click(function() {
      owl10dh.trigger('next.owl.carousel');
    });
    $('#prev_btn_10dh').click(function() {
      owl10dh.trigger('prev.owl.carousel');
    });

    //owlCarrosel of product that are shoosing Category
    var owlPupular = $('#PopularProducts .owl-carousel');
    owlPupular.owlCarousel({
        loop: true,
        margin:10,
        nav:false,
        autoplay: true,
        rewind: true,
        autoplayHoverPause: true,
        slideSpeed: 0,
        //autoplayTimeout: 1000, 
        responsive:{
            0:{
              items:1
              },
        }
    });
    $('#next_btn_pupProducts').click(function() {
         owlPupular.trigger('next.owl.carousel');
    });
    $('#prev_btn_pupProducts').click(function() {
         owlPupular.trigger('prev.owl.carousel');
    });
    });

    var owlPromo = $('#Promo_Products .owl-carousel');
    owlPromo.owlCarousel({
        loop: true,
        margin:10,
        nav:false,
        autoplay: true,
        rewind: true,
        autoplayHoverPause: true,
        slideSpeed: 0,
        //autoplayTimeout: 1000, 
        responsive:{
            0:{
              items:1
              },
        }
    });
    $('#next_btn_pupProducts').click(function() {
         owlPromo.trigger('next.owl.carousel');
    });
    $('#prev_btn_pupProducts').click(function() {
         owlPromo.trigger('prev.owl.carousel');
    });




// var swiper2 = new Swiper(".mySwiper", {
//   slidesPerView: 4,
//   centeredSlides: true,
//   spaceBetween: 10,
//   pagination: {
//     el: ".swiper-pagination2",
//     type: "fraction",
//   },
//   navigation: {
//     nextEl: ".swiper-button-next2",
//     prevEl: ".swiper-button-prev2",
//   },
//   observer: true, 
//   observeParents: true
// });

});

