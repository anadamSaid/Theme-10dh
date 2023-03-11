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
{* <div id="_desktop_cart"> *}

{if Module::getInstanceByName('prestahope_drawar')}
	<div id="_desktop_cart" class="{if Module::getInstanceByName('prestahope_drawar') && Module::getInstanceByName('prestahope_drawar')->SHOW_CART_DRAWAR=='1'}cdsohfm{/if}">
		{if Module::getInstanceByName('prestahope_drawar')->SHOW_CART_DRAWAR=='0'}
			<a href="{$link->getPageLink('cart')}?action=show">
		{/if}
			<div class="blockcart cart-preview " data-refresh-url="{$refresh_url}">
				<div class="header">
					<span class="material-icons-outlined local_mall" aria-hidden="true">local_mall</span>
					<span class="cart-products-count">{$cart.products_count}</span>
					{if $cart.products_count > 0}
						<span class="cart-bubble rubber"></span>
					{/if}
				</div>
			</div>
		{if Module::getInstanceByName('prestahope_drawar')->SHOW_CART_DRAWAR=='0'}</a>{/if}
	</div>
{else}
	<div id="_desktop_cart">
		<a href="{$link->getPageLink('cart')}?action=show">
			<div class="blockcart cart-preview " data-refresh-url="{$refresh_url}">
				<div class="header">
					<span class="material-icons-outlined local_mall" aria-hidden="true">local_mall</span>
					<span class="cart-products-count">{$cart.products_count}</span>
					
				</div>
			</div>
		</a>
	</div>
{/if}
