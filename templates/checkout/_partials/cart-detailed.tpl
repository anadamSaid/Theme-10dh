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
{block name='cart_detailed_product'}
  <div class="cart-overview js-cart" data-refresh-url="{url entity='cart' params=['ajax' => true, 'action' => 'refresh']}">
    {if $cart.products}
        <ul class="cart-items">
          {foreach from=$cart.products item=product}
            <li class="cart-item">
              {block name='cart_detailed_product_line'}
                {include file='checkout/_partials/cart-detailed-product-line.tpl' product=$product}
              {/block}
            </li>
            {if is_array($product.customizations) && $product.customizations|count >1}<hr>{/if}
          {/foreach}
          <li class="cart-item s-line2">
            <div class="cart-summary-line2">
              <span class="label">{$cart.subtotals.products.label}</span>
              <span class="value">
              {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
                {$currency.sign}{$cart.subtotals.products.amount}
              {else}
                {$currency.sign}{$cart.subtotals.products.amount}
              {/if}
              </span>
            </div>
          </li>
          <li class="cart-item show-guaranteed-message">
            <div class="show-guaranteed-message" >
              {* {hook h='displayPaiements'} *}
              <img src="/modules/prestahope_paiements/views/img/1f4df4708a2e8501f0cb02a37b7a8fac8823f78712339f4cd255011988df7500.png" alt="image Of Payment"/>
              <p>{l s='Guaranteed safe & secure checkout' d='Shop.Theme.Actions'}</p>
            </div>
          </li>
          <li class="cart-item s-g-m">
            {block name='cart_voucher'}
              {include file='checkout/_partials/cart-voucher.tpl'}
            {/block}
          </li>
        </ul>
    {else}
      <span class="no-items">{l s='There are no more items in your cart' d='Shop.Theme.Checkout'}</span>
    {/if}
  </div>
{/block}
