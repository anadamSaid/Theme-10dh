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
<section id="js-checkout-summary" class="card js-cart" data-refresh-url="{$urls.pages.cart}?ajax=1&action=refresh">
  <div class="card-block">
    {block name='hook_checkout_summary_top'}
      {include file='checkout/_partials/cart-summary-top.tpl' cart=$cart}
    {/block}

    {block name='cart_summary_products'}
      {include file='checkout/_partials/cart-summary-products.tpl' cart=$cart}
    {/block}

    {block name='cart_summary_subtotals'}
      {include file='checkout/_partials/cart-summary-subtotals.tpl' cart=$cart}
    {/block}
  </div>

  {block name='cart_summary_totals'}
    {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
  {/block}

  {block name='cart_summary_voucher'}
    {include file='checkout/_partials/cart-voucher.tpl'}
  {/block}
  <div class="vv-choose show-on-desktop">
    <h2 class="vv-choose__title"> <span>Why choose {Configuration::get('PS_SHOP_NAME')}</span> </h2>

    <div class="vv-choose__item">
      <div class="vv-choose__image">
        <img src="{$urls.img_url}1.png" alt="">
      </div>
      <div class="vv-choose__info">
        <div class="vv-choose__item-title">30 Day Money Back Guarantee*</div>
        <div class="vv-choose__item-text">If you are not satisfied with your order, just return it within 30 days of your purchase and we will give you a full refund*.</div>
      </div>
    </div>

    <div class="vv-choose__item">
      <div class="vv-choose__image">
        <img src="{$urls.img_url}2.png" alt="">
      </div>
      <div class="vv-choose__info">
        <div class="vv-choose__item-title">Free Shipping &amp; Free Returns*</div>
        <div class="vv-choose__item-text">We offer the choice of free shipping and express shipping. If you need to return your order, we will also pay for the return shipping*.</div>
      </div>
    </div>

    <div class="vv-choose__item">
      <div class="vv-choose__image">
        <img src="{$urls.img_url}3.png" alt="">
      </div>
      <div class="vv-choose__info">
        <div class="vv-choose__item-title">Many Happy Customers</div>
        <div class="vv-choose__item-text">Everyone that shops from {Configuration::get('PS_SHOP_NAME')} says it’s a great experience. We invest a lot of love and care to keep our customers satisfied.</div>
      </div>
    </div>

    <div class="vv-choose__item">
      <div class="vv-choose__info">
        <div class="vv-choose__item-text" style="font-size: 10px;">*Does not apply to all products, refer to the product page for more information.</div>
      </div>
    </div>

  </div>
</section>
