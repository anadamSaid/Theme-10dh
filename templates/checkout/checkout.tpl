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

{* {block name='header'}
  {include file='checkout/_partials/header.tpl'}
{/block} *}

{block name='content'}
  <section id="content">
  
  <div class="checkoutcont">
 
      <div class="checkoutsubcont">
  <span class="material-icons-outlined" aria-hidden="true" style=" font-size: 0px; ">cached</span>

        <div class="sscheckout">
        {if $shop.logo}
          <div class="checkout-shop-img"><img src="{$shop.logo}" alt="logo" loading="lazy"></div>
          {else}
          <h1 class="checkout-shop-title">{block name='page_title'}{$shop.name}{/block}</h1>
        {/if}
          <nav  id="vv-c-header-price" >
          <div class="vv-c-header-content">
            <span class="">
              <svg viewBox="0 0 20 20" class="" focusable="false" aria-hidden="true"><path d="M17.178 13.088H5.453c-.454 0-.91-.364-.91-.818L3.727 1.818H0V0h4.544c.455 0 .91.364.91.818l.09 1.272h13.45c.274 0 .547.09.73.364.18.182.27.454.18.727l-1.817 9.18c-.09.455-.455.728-.91.728zM6.27 11.27h10.09l1.454-7.362H5.634l.637 7.362zm.092 7.715a1.817 1.817 0 10.002-3.634 1.817 1.817 0 00-.002 3.634zm9.18 0a1.816 1.816 0 10-.001-3.635 1.818 1.818 0 000 3.635z"></path></svg>
            </span>
            <span class="vv-c-header-text">Show order summary</span>
            <span class="aroowdnup"><svg viewBox="0 0 14 14" class="" focusable="false" aria-hidden="true"><path d="M12.6 3L14 4.4 8.4 10 7 11.4 5.6 10 0 4.4 1.4 3 7 8.6"></path></svg></span></span>
          </div>
            <h2>*,**</h2>
          </nav>
          <nav aria-label="Breadcrumbs" id="vv-c-bread-crumbs" >
            <ol role="list" id="vv-nav-steps">
            </ol>
          </nav>
          <div>
            {block name='checkout_process'}
              {render file='checkout/checkout-process.tpl' ui=$checkout_process}
            {/block}
          </div>
          <div class="checkout-footer-links-con">
            <ul class="checkout-footer-links">
              {foreach from=CMS::getCMSPages(1,1,true) item=cmspages}
                {* {$cmspages|@var_dump} *}
                {if $cmspages.meta_title != "About us"}
                  <li>
                    <a target="_blank" href="{$link->getCMSLink($cmspages.id_cms, $cmspages.link_rewrite)|escape:'htmlall':'UTF-8'}">{$cmspages.meta_title|escape:'htmlall':'UTF-8'}</a>
                  </li>
                {/if}
              {/foreach}
            </ul>
          </div>
        </div>
      </div>
      <div class="checkoutsummarycont">
        {block name='cart_summary'}
          {include file='checkout/_partials/cart-summary.tpl' cart=$cart}
        {/block}
      </div>
    </div>
  </section>
    {hook h='displayThemeConfig'}
{/block}


{* {block name='footer'}
  {include file='checkout/_partials/footer.tpl'}
{/block} *}
