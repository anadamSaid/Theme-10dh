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

{if !empty($subcategories)}
  {if (isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories) }
    <div id="subcategories" class="">
      <h2 class="subcategory-heading">{l s='Subcategories' d='Shop.Theme.Category'}</h2>
      <div class="swiper-container3">
      <div class="slider slider-single6">
          {foreach from=$subcategories item=subcategory}
                <a href="{$subcategory.url}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="swiper-slide category-swiper">
                  <div class="subcategory-con">
                    {if !empty($subcategory.image.medium.url)}
                      <img
                      src="{$subcategory.image.medium.url}"
                      alt="{$subcategory.name|escape:'html':'UTF-8'}"
                      loading="lazy"
                      width="{$subcategory.image.medium.width}"
                      height="{$subcategory.image.medium.height}"/>
                    {/if}
                    <h4>{$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'}</h4>
                  </div>  
                </a>
              {* {if $subcategory.description}
                <div class="cat_desc">{$subcategory.description|unescape:'html' nofilter}</div>
              {/if} *}
          {/foreach}
        </div>
    </div>
    </div>
<script>

</script>
{/if}
{/if}
