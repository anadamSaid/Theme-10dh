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
{extends file=$layout}


{block name='head' append}
  <meta property="og:type" content="product">
  {if $product.cover}
    <meta property="og:image" content="{$product.cover.large.url}">
  {/if}

  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}

{/block}

{block name='head_microdata_special'}
  {include file='_partials/microdata/product-jsonld.tpl'}
{/block}

{block name='content'}

  <section id="main">
    <meta content="{$product.url}">

    <div class="row product-container js-product-container">
      <div class="col-md-6 _sticky">
        {block name='page_content_container'}
          <section class="page-content" id="content">
            {block name='page_content'}
              {* {include file='catalog/_partials/product-flags.tpl'} *}
            
              {block name='product_cover_thumbnails'}
                <div class="images-container js-images-container">
                {block name='product_cover'}
                  <div class="product-cover">
                    <div class="slider slider-single hideonlaod">
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
                  <div class="slider slider-nav prodslider hideonlaod">
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
                  
                {/block}
              {hook h='displayAfterProductThumbs' product=$product}
              {/block}
              <div class="scroll-box-arrows">
                <i class="material-icons left">&#xE314;</i>
                <i class="material-icons right">&#xE315;</i>
              </div>

            {/block}
          </section>
        {/block}
      </div>
      <div class="col-md-6">
        {assign var=tags value=Tag::getProductTags(Tools::getValue('id_product'))}
        {block name='page_header_container'}
          {block name='page_header'}
            <h1 class="product-page-name">{block name='page_title'}{$product.name}{/block}</h1>
          {/block}
        {/block}
        {block name='product_prices'}
          {include file='catalog/_partials/product-prices.tpl'}
        {/block}

        <div class="product-information">
          {* {block name='product_description_short'}
            <div id="product-description-short-{$product.id}" class="product-description">{$product.description_short nofilter}</div>
          {/block} *}
        {hook h='displayProductActions' product=$product}

          {if $product.is_customizable && count($product.customizations.fields)}
            {block name='product_customization'}
              {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
            {/block}
          {/if}

          <div class="product-actions js-product-actions">
            {block name='product_buy'}
              <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                <input type="hidden" name="token" value="{$static_token}">
                <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id" class="js-product-customization-id">
                
								{if ($page.page_name == 'product') }
                    <nav class="header-nav" id="product-nav">
                      <div class="container">
                      <div class="flex-pn">
                          <div>
                            {if $product.default_image}
                                    <img
                                      class="img-fluid" id="setimgonlaod"
                                      src="{$product.images[0].bySize.large_default.url}"
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
                          <div class="pmtitle ">
                            <h5>{$product.name}</h5>
                            <div>
                              <span class="ptnm">
                                {if '' !== $smarty.capture.custom_price}
                                  {$smarty.capture.custom_price nofilter}
                                {else}
                                  {$product.price}
                                {/if}
                                <span>
                                {block name='product_discount'}
                                  {if $product.has_discount}
                                    <div class="product-discount hidden-sm-down">
                                      {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                      <span class="regular-price">{$product.regular_price}</span>
                                    </div>
                                  {/if}
                                {/block}
                              </span>
                              {if $product.has_discount}
                                {if $product.discount_type === 'percentage'}
                                  <span class="discount discount-percentage hidden-sm-down"><span class="material-icons-outlined">local_offer</span>{l s='Save %percentage%' d='Shop.Theme.Catalog' sprintf=['%percentage%' => $product.discount_percentage_absolute]}</span>
                                {else}
                                  <span class="discount discount-amount hidden-sm-down">
                                  <span class="material-icons-outlined">local_offer</span>{l s='Save %amount%' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.discount_to_display]}
                                  </span>
                                {/if}
                              {/if}
                              </span>
                            </div>
                          </div>
                          <div class="flex-spr">
                            {* <div class="pp-qnty-add product-quantity clearfix">
                              <div class="qty">
                                <div class="input-group bootstrap-touchspin"><span class="input-group-btn"><button class="btn btn-default bootstrap-touchspin-down" type="button">-</button></span><span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span><input type="number" name="qty" id="quantity_wanted" inputmode="numeric" pattern="[0-9]*" value="1" min="1" class="input-group form-control" aria-label="Quantity" style="display: block;"><span class="input-group-addon bootstrap-touchspin-postfix" style="display: none;"></span><span class="input-group-btn"><button class="btn btn-default bootstrap-touchspin-up" type="button">+</button></span></div>
                              </div>
                            </div> *}
                          </div>
                            <div class="cqty qty pp-qnty-add product-quantity clearfix hidden-sm-down">
                              <div class="input-group bootstrap-touchspin">
                                <button id="cqty-remove"  class="btn btn-default bootstrap-touchspin-down" type="button">-</button>
                                  <input
                                  type="text"
                                  id="cqinp"
                                  value="{$product.quantity_wanted}"
                                  class="input-group"
                                  min="{$product.minimal_quantity}"
                                  aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
                                  readonly
                                  >
                                <button id="cqty-add" class="btn btn-default bootstrap-touchspin-up" type="button">+</button>
                              </div>
                            </div>
                          
                          <div >
                            <div class="add">
                              <button
                              class="btn btn-primary add-to-cart add-to-cart-prod {if !$product.add_to_cart_url}vvdtld{/if}"
                                data-button-action="add-to-cart"
                                type="submit"
                                {if !$product.add_to_cart_url}
                                  disabled
                                {/if}
                              >
                              <span class="material-icons-outlined local_mall" aria-hidden="true">local_mall</span>
                                <span class="add-to-cart-text">
                                  {if !$product.add_to_cart_url}
                                    {l s='Sold out' d='Shop.Theme.Actions'}
                                  {else}
                                    {l s='Add to cart' d='Shop.Theme.Actions'}
                                  {/if}
                                </span>
                              </button>
                            </div>
                          </div>
                        
                      
                          </div>
                      </div>
                    </nav>
                  {/if}
                {block name='product_variants'}
                  {include file='catalog/_partials/product-variants.tpl'}
                {/block}

                {block name='product_pack'}
                  {if $packItems}
                    <section class="product-pack">
                      <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                      {foreach from=$packItems item="product_pack"}
                        {block name='product_miniature'}
                          {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                        {/block}
                      {/foreach}
                  </section>
                  {/if}
                {/block}

                {block name='product_discounts'}
                  {include file='catalog/_partials/product-discounts.tpl'}
                {/block}

                {block name='product_add_to_cart'}
                  {include file='catalog/_partials/product-add-to-cart.tpl'}
                {/block}

                {block name='product_additional_info'}
                  {include file='catalog/_partials/product-additional-info.tpl'}
                {/block}

                {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                {block name='product_refresh'}{/block}
              </form>
            {/block}

          </div>

          {* {block name='hook_display_reassurance'}
            {hook h='displayReassurance'}
          {/block} *}

          {block name='product_tabs'}        
            
            <div >
              <ul class="nav">
                {if $product.description}
                  <div>  
                      <a class="btn btn-primary cllapse-info collapsed" data-toggle="collapse" href="#description" role="button" aria-expanded="false" aria-controls="collapseExample">
                        {l s='Description' d='Shop.Theme.Catalog'}
                      </a>
                      <div id="description" class="collapse">
                      {block name='product_description'}
                        <div class="product-description">{$product.description_short nofilter}</div>
                        {* <div class="product-description">{$product.description nofilter}</div> *}
                      {/block}
                    </div>
                  </div>
                {/if}
                <div>  
                  <a class="btn btn-primary cllapse-info collapsed" data-toggle="collapse" href="#product-details" role="button" aria-expanded="false" aria-controls="collapseExample">
                    {l s='Product Details' d='Shop.Theme.Catalog'}
                  </a>
                  {block name='product_details'}
                    {include file='catalog/_partials/product-details.tpl'}
                  {/block}
                </div>
                {if $product.attachments}
                  <div>
                    <a
                      class="btn btn-primary cllapse-info collapsed"
                      href="#attachments"
                      data-toggle="collapse"  role="button" aria-expanded="false" aria-controls="attachments"
                      >{l s='Attachments' d='Shop.Theme.Catalog'}</a>
                    {block name='product_attachments'}
                      {if $product.attachments}
                        <div class="tab-pane fade in" id="attachments" role="tabpanel">
                          <section class="product-attachments">
                            <p class="h5 text-capitalize">{l s='Download' d='Shop.Theme.Actions'}</p>
                            {foreach from=$product.attachments item=attachment}
                              <div class="attachment">
                                <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                                <p>{$attachment.description}</p>
                                <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                                  {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                                </a>
                              </div>
                            {/foreach}
                          </section>
                        </div>
                      {/if}
                    {/block}
                  </div>
                {/if}
                {* {foreach from=$product.extraContent item=extra key=extraKey}
                  <li class="nav-item">
                    <a
                      data-toggle="collapse"  role="button" aria-expanded="false"
                      class="nav-link"
                      href="#extra-{$extraKey}"
                      aria-controls="extra-{$extraKey}">{$extra.title}</a>
                  </li>
                {/foreach} *}
              </ul>

              <div >
              

                

              

                {* {foreach from=$product.extraContent item=extra key=extraKey}
                <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                  {$extra.content nofilter}
                </div>
                {/foreach} *}
            </div>
            
              
            {if $tags}	  
              <div class="tags_block">
                <div class="block_content">
                  {assign var=lang value=intval(Context::getContext()->cookie->id_lang)}
                  <ul class="tagsul tagsul2">
                  <li class="tag-label"><span class="material-icons-outlined" aria-hidden="true">local_offer</span>{l s='Tags' d='Admin.Actions'}</li>
                    {foreach from=$tags.$lang item=value}
                      <li>
                        <a class="tag_level1 item" target="_blank" href="{$link->getPageLink('search', true, NULL, "tag={$value|urlencode}")}">{$value|escape:html:'UTF-8'}</a>
                      </li>
                    {/foreach}
                  </ul>
                </div>
              </div>
            {/if}
            <div class="tags_block">
              <div class="block_content">
                {assign var=lang value=intval(Context::getContext()->cookie->id_lang)}
                <ul class="tagsul">
                  <li class="tag-label"><span class="material-icons-outlined" aria-hidden="true">layers</span>{l s='Catalog' d='Admin.Actions'}</li>
                  {foreach from=Product::getProductCategoriesFull($product.id) item=cat}
                    <li>
                      <a class="tag_level1 item" target="_blank" href="{$link->getCategoryLink({$cat.id_category})}" title="{$cat.name}">{$cat.name}</a></li>
                    </li>
                  {/foreach}
                </ul>
              </div>
            </div>
            {if $page.page_name == "product"}
              <div class="shaireBellowProduct">
                {hook h="displayShareButtons" product=$product}
              </div>
            {/if}
          </div>
        {/block}
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 bt1px">
        <div class="product-description">{$product.description nofilter}</div>
      </div>
    </div>
    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix">
          <p class="h5 text-capitalize">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
          <div class="products row">
            {foreach from=$accessories item="product_accessory" key="position"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position productClasses="col-xs-6 col-sm-6 col-lg-4 col-xl-3"}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}
   
    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}		
      <script>
          var wishList_Products = JSON.parse(localStorage.getItem("WishListId") || "[]");
          var allPageProducts = document.getElementsByClassName('wishlist-button-add-remove');

          for (let index = 0; index < allPageProducts.length; index++) {
          const element = allPageProducts[index];
          if(wishList_Products.includes(element.attributes["data-productid"].value*1)){
              element.querySelector('.material-icons-outlined').textContent = "favorite"
              element.classList.add("inwishlist");
          }   
          }
          var wishList_Products = JSON.parse(localStorage.getItem("WishListId") || "[]");

          document.getElementById('wishlist-p-count').textContent= wishList_Products.length;
          document.getElementById('wishlist-p-count2').textContent= wishList_Products.length;
          if(wishList_Products.length){
          document.getElementById('wishlist-rubber').classList.remove("hide")
          document.getElementById('wishlist-rubber2').classList.remove("hide")
          }else{
          document.getElementById('wishlist-rubber').classList.add("hide")
          document.getElementById('wishlist-rubber2').classList.add("hide")
          }
          function AddToList(x){
            var wishList_Products = JSON.parse(localStorage.getItem("WishListId") || "[]");
            var queryselect  = "button[data-productid='"+x+"']";  
            var elem = document.querySelectorAll(queryselect)  ;
            if(wishList_Products.includes(x)){
                  var index = wishList_Products.indexOf(x);
                  if (index !== -1) {
                        wishList_Products.splice(index, 1);
                        localStorage.setItem("WishListId", JSON.stringify(wishList_Products));
                  }
                  document.getElementById('wishlist-p-count').textContent= wishList_Products.length;
                  document.getElementById('wishlist-p-count2').textContent= wishList_Products.length;
                  if(wishList_Products.length){
                        document.getElementById('wishlist-rubber').classList.remove("hide")
                        document.getElementById('wishlist-rubber2').classList.remove("hide")
                  }else{
                        document.getElementById('wishlist-rubber').classList.add("hide")
                        document.getElementById('wishlist-rubber2').classList.add("hide")
                  }
                  for (let index = 0; index < elem.length; index++) {
                        const element = elem[index];
                        element.querySelector('.material-icons-outlined').textContent =  "favorite_border" ;       
                        element.classList.remove("inwishlist");
                  }
                  
            }else{
                  wishList_Products.push(x)
                  localStorage.setItem("WishListId", JSON.stringify(wishList_Products));
                  document.getElementById('wishlist-p-count').textContent= wishList_Products.length;
                  document.getElementById('wishlist-p-count2').textContent= wishList_Products.length;
                  if(wishList_Products.length){
                        document.getElementById('wishlist-rubber').classList.remove("hide")
                        document.getElementById('wishlist-rubber2').classList.remove("hide")
                  }else{
                        document.getElementById('wishlist-rubber').classList.add("hide")
                        document.getElementById('wishlist-rubber2').classList.add("hide")
                  }
                  for (let index = 0; index < elem.length; index++) {
                        const element = elem[index];
                        element.querySelector('.material-icons-outlined').textContent =  "favorite" ;       
                        element.classList.add("inwishlist");
                  }
            }
          }

      </script>
  </section>
  
{/block}
