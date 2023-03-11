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
<section class="col-md-6 col-xs-12 featured-products clearfix" id="PopularProducts">
    <div class="products-section-title container_ttl">
        <h2 class="h2 products-section-title text-capitalize">
            {l s='Popular Products' d='Shop.Theme.Catalog'}
        </h2>
        <div class="Move_Products">
          <div class="swiper-button-prev" id="prev_btn_pupProducts"></div>
          <div class="swiper-button-next" id="next_btn_pupProducts"></div>
        </div>
    </div>
    {include file="catalog/_partials/productlist.tpl" products=$products cssClass="row owl-carousel" productClass="PopularProducts"}
    <div class="seemore">
      <a class="all-product-link float-xs-left float-md-right h4" href="{$allProductsLink}">
        <span>{l s='View all' d='Shop.Theme.Catalog'}</span><i class="material-icons">&#xE315;</i>
      </a>
    </div>
</section>
<script type='text/javascript' src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script defer type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" ></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<script type='text/javascript'>
// $(document).ready(function() {
//   var owl = $('#PopularProducts .owl-carousel');
//   owl.owlCarousel({
//       loop: true,
//       margin:10,
//       nav:false,
//       autoplay: true,
//       rewind: true,
//       autoplayHoverPause: true,
//       slideSpeed: 0,
//       //autoplayTimeout: 1000, 
//       responsive:{
//           0:{
//             items:1
//             },
//           420:{
//             items:2
//             },
//           600:{
//             items:3
//             },
//           992:{
//             items:4
//             },
//           1200:{
//             items:5
//             },
//       }
//   });
// });
</script>
