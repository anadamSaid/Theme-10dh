{**
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
 *}

<section class="featured-products clearfix mt-3">
    <div #swiperRef="" class="swiper" id="products_10dh">
      <div class="products-section-title container_ttl">
      <h2 class="h2 products-section-title text-capitalize">
      {l s='Products -10Dh' d='Shop.Theme.Catalog'}
      </h2>
      <div class="Move_Products">
        <div class="swiper-button-prev" id="prev_btn_10dh"></div>
        <div class="swiper-button-next" id="next_btn_10dh"></div>
      </div>
      </div>
      {include file="catalog/_partials/productlist.tpl" products=$products cssClass="owl-carousel" productClass="SS" }
    </div>
    <div class="seemore">
      <a class="all-product-link float-xs-left float-md-right h4" href="{$allNewProductsLink}">
        <span>{l s='View all' d='Shop.Theme.Catalog'}</span><i class="material-icons">&#xE315;</i>
      </a>
    </div>
</section>
<script type='text/javascript' src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script defer type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" ></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<script type='text/javascript'>
$(document).ready(function() {
  var owl = $('#products_10dh .owl-carousel');
  owl.owlCarousel({
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
  owl.on('changed.owl.carousel', function(event) {
      var currentItem = event.item.index;
      var totalItems = event.item.count;
      // console.log(currentItem);
      // Disable next button if on last item
      if (currentItem >= totalItems) {
        document.querySelector(".Move_Products #next_btn_10dh").classList.add("swiper-button-disabled");
        setTimeout(() => {
          owl.trigger('to.owl.carousel', [0, 500, true]);   
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
    owl.trigger('next.owl.carousel');
});
$('#prev_btn_10dh').click(function() {
    owl.trigger('prev.owl.carousel');
});
});
</script>
<style>
.owl-carousel .owl-item {
  -webkit-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
}
</style>





























{* <!-- Slider main container -->
<div #swiperRef="" class="swiper mySwiper">
    <div class="swiper-wrapper">
      <div class="swiper-slide">Slide 1</div>
      <div class="swiper-slide">Slide 2</div>
      <div class="swiper-slide">Slide 3</div>
      <div class="swiper-slide">Slide 4</div>
    </div>
    <div class="swiper-button-next2"></div>
    <div class="swiper-button-prev2"></div>
    <div class="swiper-pagination2"></div>
  </div> *}


