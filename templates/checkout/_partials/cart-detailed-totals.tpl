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
{block name='cart_detailed_totals'}
<div class="cart-detailed-totals js-cart-detailed-totals">
{block name='cart_summary_total'}
  {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
    {* <div class="cart-summary-line">
      <span class="label">{$cart.totals.total.label}&nbsp;{$cart.labels.tax_short}</span>
      <span class="value">{$cart.totals.total.value}</span>
    </div> *}
    <div class="cart-summary-line cart-total c-total ">
      <span class="label">{$cart.subtotals.products.label}</span>
      <span class="value">
      {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
        {$currency.sign}{$cart.subtotals.products.amount}
      {else}
        {$currency.sign}{$cart.subtotals.products.amount}
      {/if}
      </span>
    </div>
  {else}
    <div class="cart-summary-line c-total">
      <span class="label">{$cart.totals.total.label}&nbsp;{if $configuration.display_taxes_label && $configuration.taxes_enabled}{$cart.labels.tax_short}{/if}</span>
      <span class="value">{$cart.totals.total.value}</span>
    </div>
  {/if}
{/block}
<hr class="separator">

  <div class="card-block cart-detailed-subtotals js-cart-detailed-subtotals">
  <p class="text-center">{l s='Taxes and shipping calculated at checkout' d='Admin.Actions'}</p>
    {* {foreach from=$cart.subtotals item="subtotal"}
      {if $subtotal && $subtotal.value|count_characters > 0 && $subtotal.type !== 'tax'}
        <div class="cart-summary-line" id="cart-subtotal-{$subtotal.type}">
          <span class="label{if 'products' === $subtotal.type} js-subtotal{/if}">
            {if 'products' == $subtotal.type}
              {$cart.summary_string}
            {else}
              {$subtotal.label}
            {/if}
          </span>
          <span class="value">
            {if 'discount' == $subtotal.type}-&nbsp;{/if}{$subtotal.value}
          </span>
          {if $subtotal.type === 'shipping'}
              <div><small class="value">{hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}</small></div>
          {/if}
        </div>
      {/if}
    {/foreach}
    {block name='cart_summary_total'}
      {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
        <div class="cart-summary-line">
          <span class="label">{$cart.totals.total.label}&nbsp;{$cart.labels.tax_short}</span>
          <span class="value">{$cart.totals.total.value}</span>
        </div>
      {else}
        <div class="cart-summary-line">
          <span class="label">{$cart.totals.total.label}&nbsp;{if $configuration.display_taxes_label && $configuration.taxes_enabled}{$cart.labels.tax_short}{/if}</span>
          <span class="value">{$cart.totals.total.value}</span>
        </div>
      {/if}
    {/block} *}
  </div>


  {block name='cart_voucher'}
    {include file='checkout/_partials/cart-voucher.tpl'}
  {/block}
</div>
{/block}
