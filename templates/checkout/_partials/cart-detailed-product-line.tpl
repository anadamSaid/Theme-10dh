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
 <div class="product-line-grid">
 <!--  product line left content: image-->
 <div class="product-line-grid-left col-md-3 col-xs-3">
   <span class="product-image media-middle">
     {if $product.default_image}
       <img src="{$product.default_image.bySize.cart_default.url}" alt="{$product.name|escape:'quotes'}" loading="lazy">
     {else}
       <img src="{$urls.no_picture_image.bySize.cart_default.url}" loading="lazy" />
     {/if}
   </span>
 </div>

 <!--  product line body: label, discounts, price, attributes, customizations -->
 <div class="product-line-grid-body col-md-9 col-xs-9">
   <div class="product-line-info">
     <a class="label" href="{$product.url}"
       data-id_customization="{$product.id_customization|intval}">{$product.name}</a>
     <a class="remove-from-cart" rel="nofollow" href="{$product.remove_from_cart_url}"
       data-link-action="delete-from-cart" data-id-product="{$product.id_product|escape:'javascript'}"
       data-id-product-attribute="{$product.id_product_attribute|escape:'javascript'}"
       data-id-customization="{$product.id_customization|default|escape:'javascript'}">
       {if empty($product.is_gift)}
        <span class="material-icons-outlined" aria-hidden="true">delete</span>
       {/if}
     </a>
   </div>
   <div class="row">
     <div class="col-md-12">
       <div class="row qty-price-con">
         <div class="col-md-6 qty">
         <div class="product-line-info product-attributes">
            {* {foreach from=$product.attributes key="attribute" item="value"}
              <span class="value">{$value}</span>
              <span class="value">{$}</span>
            {/foreach} *}
            {foreach $product.attributes as $i}
              <span class="value csvc">{$i}
              {if $i@index != count($product.attributes)-1}
                /
              {/if}
              </span>
              {* <span class="value">{$}</span> *}
            {/foreach}
          </div>
           {if !empty($product.is_gift)}
             <span class="gift-quantity">{$product.quantity}</span>
           {else}
             <input id="cartqipt" class="js-cart-line-product-quantity" data-down-url="{$product.down_quantity_url}"
               data-up-url="{$product.up_quantity_url}" data-update-url="{$product.update_quantity_url}"
               data-product-id="{$product.id_product}" type="number" inputmode="numeric" pattern="[0-9]*"
               value="{$product.quantity}" name="product-quantity-spin"
               aria-label="{l s='%productName% product quantity field' sprintf=['%productName%' => $product.name] d='Shop.Theme.Checkout'}" />
           {/if}
         </div>
         <div class="col-md-6 price">
           <span class="product-price">
          
          {* {if $product.has_discount}   
            <div class="product-discount">
            <span>{$product.quantity}</span>
            </div> 
          {/if} *}
           <strong>
               {if !empty($product.is_gift)}
                 <span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
               {else}
                 {$product.total}
               {/if}
             </strong>
           </span>
         </div>
       </div>
     </div>
   </div>
 </div>
 <div class="clearfix"></div>
</div>
{* <script>
alert("test")
</script> *}