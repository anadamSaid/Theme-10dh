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
 {block name='product_cover'}
  <div class="images-container js-images-container">
    <div class="product-cover">
      <div class="slider slider-single2 hideonlaod">
        {if $product.default_image}
          {foreach from=$product.images item=image}
            <div class="swiper-slide product-page-swiper">
                <img
                  class="img-fluid"
                  src="{$image.bySize.large_default.url}"
                  {if !empty($product.default_image.legend)}
                    alt="{$product.default_image.legend}"
                    title="{$product.default_image.legend}"
                  {else}
                    alt="{$product.name}"
                  {/if}
                  loading="lazy"
                  width="{$product.default_image.bySize.large_default.width}"
                  height="{$product.default_image.bySize.large_default.height}"
                >
            </div>

          {/foreach}
        </div>
        {else}
        <img
          class="img-fluid"
          src="{$urls.no_picture_image.bySize.medium_default.url}"
          loading="lazy"
          width="{$urls.no_picture_image.bySize.medium_default.width}"
          height="{$urls.no_picture_image.bySize.medium_default.height}"
        >
      {/if}
    </div>
    <div class="slider slider-nav2 prodslider hideonlaod">
    {if $product.default_image}
      {foreach from=$product.images item=image}
        <div class="slider-n-p-con">
          <img
          src="{$image.bySize.large_default.url}"
          {if !empty($product.default_image.legend)}
            alt="{$product.default_image.legend}"
            title="{$product.default_image.legend}"
          {else}
            alt="{$product.name}"
          {/if}
          loading="lazy"
          width="{$product.default_image.bySize.large_default.width}"
          height="{$product.default_image.bySize.large_default.height}"
        >
        </div>

      {/foreach}
    {else}
      <img
        class="img-fluid"
        src="{$urls.no_picture_image.bySize.medium_default.url}"
        loading="lazy"
        width="{$urls.no_picture_image.bySize.medium_default.width}"
        height="{$urls.no_picture_image.bySize.medium_default.height}"
      >
    {/if}
    
    </div>
    <script>
    setTimeout(() => {
      $(".slider-single2").on('init', function(event, slick){
        $('.slick-slide img').addClass("showafterload");
      });
      $(".slider-nav2").on('init', function(event, slick){
        $('.slick-slide img').addClass("showafterload");
      });
      $(".slider-single2").slick({
        centerMode: true,
        centerPadding: '10px',
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        infinite:false,
        fade: false,
        useTransform: true,
        asNavFor: ".slider-nav2"
      });
      $(".slider-nav2").slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        asNavFor: ".slider-single2",
        dots: false,
        infinite:false,
        arrows: false,
        focusOnSelect: true
      });
    }, 1000);

    </script>
  </div>

{/block}
