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
{block name='product_miniature_item'}
<div class="js-product product{if !empty($productClasses)} {$productClasses}{/if}">
  <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
    <div class="thumbnail-container">
      <div class="thumbnail-top">
        {block name='product_thumbnail'}
          {if $product.cover}
            <a href="{$product.url}" class="thumbnail product-thumbnail first-img">
              <img
                class = "img-one center-block img-responsive"
                src="{$product.cover.bySize.home_default.url}"
                alt = "{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name}{/if}"
                data-full-size-image-url = "{$product.cover.large.url}"
                width="{$product.cover.bySize.home_default.width}" height="{$product.cover.bySize.home_default.height}"
              >
              {$count=0}
              {foreach from=$product.images item=image}
                {if $count==0}
                  <img class="second-img img-responsive center-block"  
                    src="{$image.bySize.home_default.url}"
                    alt="{$image.legend}"
                    title="{$image.legend}"
                    itemprop="image"
                    width="{$product.cover.bySize.home_default.width}" height="{$product.cover.bySize.home_default.height}"
                  >
                {/if} {$count=$count+1}
              {/foreach}
            </a>
          {else}
            <a href="{$product.url}" class="thumbnail product-thumbnail">
              <img class="img-responsive center-block"
              src="{$urls.no_picture_image.bySize.home_default.url}"
              >
            </a>
          {/if}
        {/block}
      </div>
        <div class="thmub-info">
        <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
              <input type="hidden" name="token" value="{$static_token}">
              <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
              <input type="hidden" name="qty" inputmode="numeric" pattern="[0-9]*"
                {if $product.quantity_wanted}
                  value="{$product.quantity_wanted}"
                  min="{$product.minimal_quantity}"
                {else}
                  value="1"
                  min="1"
                {/if}
              >
            {* {if $product.quantity < 1}out-of-stock{/if} *}
                      <button class="btn btn-primary add-to-cart {if !$product.add_to_cart_url}vvdtld{/if}"  data-button-action="add-to-cart" type="submit"
                        {if !$product.add_to_cart_url}
                          disabled
                        {/if}
                      >
                      <span class="add-to-cart-text">
                        {if !$product.add_to_cart_url}
                          {l s='Sold out' d='Shop.Theme.Actions'}
                        {else}
                          {l s='Add to cart' d='Shop.Theme.Actions'}
                        {/if}
                      </span>
                  </button>
        </form>
        <div class="highlighted-informations{if !$product.main_variants} no-variants{/if}">
          {* {block name='quick_view'}
            <a class="quick-view js-quick-view" href="#" data-link-action="quickview">
              <i class="material-icons search">&#xE8B6;</i> {l s='Quick view' d='Shop.Theme.Actions'}
            </a>
          {/block} *}

          {block name='product_variants'}
            {if $product.main_variants}
              {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
            {/if}
          {/block}
        </div>
        <div class="product-description">
          {block name='product_name'}
            {if $page.page_name == 'index'}
              <h3 class="h3 product-title"><a href="{$product.url}" content="{$product.url}">{$product.name|truncate:50:'...'}</a></h3>
            {else}
              <h2 class="h3 product-title"><a href="{$product.url}" content="{$product.url}">{$product.name|truncate:50:'...'}</a></h2>
            {/if}
          {/block}

          {block name='product_price_and_shipping'}
            {if $product.show_price}
              <div class="product-price-and-shipping">
                {if $product.has_discount}
                  {hook h='displayProductPriceBlock' product=$product type="old_price"}

                  <span class="regular-price" aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
                  {if $product.discount_type === 'percentage'}
                    <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
                  {elseif $product.discount_type === 'amount'}
                    <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                  {/if}
                {/if}

                {hook h='displayProductPriceBlock' product=$product type="before_price"}

                <span class="price" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">
                  {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
                  {if '' !== $smarty.capture.custom_price}
                    {$smarty.capture.custom_price nofilter}
                  {else}
                    {$product.price}
                  {/if}
                </span>

                {hook h='displayProductPriceBlock' product=$product type='unit_price'}

                {hook h='displayProductPriceBlock' product=$product type='weight'}
              </div>
            {/if}
          {/block}

          {* {block name='product_reviews'}
            {hook h='displayProductListReviews' product=$product}
          {/block} *}



            

        </div>
      </div>


      
    
      <div class="product-acts">
        {if !$customer.is_logged}
          {include file='catalog/_partials/Product-Button.tpl'}
        {/if}
        <a class="prod-acts-elem quick-view js-quick-view" href="#" data-link-action="quickview">
          <i class="material-icons-outlined">remove_red_eye</i>
        </a>
      </div>
      
      {* {include file='catalog/_partials/product-flags.tpl'} *}
    </div>
  </article>
</div>
{/block}
