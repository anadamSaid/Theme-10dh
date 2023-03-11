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
{block name='cart_detailed_actions'}
  <div class="checkout cart-detailed-actions js-cart-detailed-actions card-block">
  {* <p class="tax-ship">{l s='Taxes and shipping calculated at checkout' d='Shop.Theme.Actions'}</p> *}
    {if $cart.minimalPurchaseRequired}
      <div class="alert alert-warning" role="alert">
        {$cart.minimalPurchaseRequired}
      </div>
      <div class="text-sm-center">
        <button type="button" class="btn btn-primary disabled" disabled>
          <span class="material-icons-outlined local_mall" aria-hidden="true">lock</span>
          {l s='Check Out - ' d='Shop.Theme.Actions'}
          {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
              {$cart.subtotals.products.amount}
          {else}
          {$cart.subtotals.products.amount}
          {/if}
        </button>
      </div>
    {elseif empty($cart.products) }
      <div class="text-sm-center">
        <a href="/2-home" class="btn btn-primary">
          {l s='Continue browsing' d='Shop.Theme.Actions'}
        </a>
      </div>
    {else}
      <div class="text-sm-center">
        <a href="{$urls.pages.order}" class="btn btn-primary">
          <span class="material-icons-outlined local_mall" aria-hidden="true">lock</span>
          {l s='Check Out - ' d='Shop.Theme.Actions'}
          {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
            {$currency.sign}{$cart.subtotals.products.amount}
          {else}
            {$currency.sign}{$cart.subtotals.products.amount}
          {/if}
        </a>
        {hook h='displayExpressCheckout'}
      </div>
    {/if}
    {if $page.page_name == 'cart'}
      <p class="text-grtd">{l s='Guaranteed safe & secure checkout' d='Shop.Theme.Actions'}</p>
    {/if}
  </div>
{/block}
