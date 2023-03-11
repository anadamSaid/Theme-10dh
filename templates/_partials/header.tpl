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
{* {block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block} *}
{* {$urls.pages|@var_dump} *}
  <span class="hide js-product-miniature" >
    <span class="hide thumbnail-container">
      <span class="hide product-acts">
      </span>
    </span>
  </span>
 
{block name='header_nav'}
  <nav class="header-nav {($page.page_name == 'index' && Module::isEnabled('prestahope_categoryfeature'))?'header-nav-transparent':''}">
    <div class="container">
      <div class="row">
        <div class="hidden-sm-down nav-cont">
          <div class="col-md-2 desklogo" id="_desktop_logo">
            {* {hook h='displayNav1'} *}
            {if $shop.logo_details}
              {if $page.page_name == 'index'}
                <h1>
                  {renderLogo}
                </h1>
              {else}
                {renderLogo}
              {/if}
            {/if}
          </div>
          {hook h='displaysearchbar'}
          <div class="col-md-2 right-nav">
            {hook h='displayNav2'}
              <a href="{if $customer.is_logged}{$link->getModuleLink('blockwishlist', 'lists')}{else}{$link->getModuleLink('WishListModule','fcont')}{/if}" class="_desktop_nav_wishlist">
                <div class="blockwishlist cart-preview ">
                  <div class="header">
                    {* {if $cart.products_count > 0}
                      <a rel="nofollow" aria-label="{l s='Shopping cart link containing %nbProducts% product(s)' sprintf=['%nbProducts%' => $cart.products_count] d='Shop.Theme.Checkout'}" href="{$cart_url}">
                    {/if} *}
                      {* <i class="material-icons local_mall" aria-hidden="true">local_mall</i> *}
                      <span class="material-icons-outlined local_mall" aria-hidden="true">favorite_border</span>
                      {* <span class="hidden-sm-down">{l s='Cart' d='Shop.Theme.Checkout'}</span> *}
                      <span class="cart-products-count" id="wishlist-p-count">0</span>
                    {* {if $cart.products_count > 0} *}
                      <span class="cart-bubble rubber hide" id="wishlist-rubber"></span>
                    {* {/if} *}
                    {* {if $cart.products_count > 0}
                      </a>
                    {/if} *}
                  </div>
                </div>
              </a>
            {if count(Currency::getCurrencies(true))>1||count(Language::getLanguages(true))>1}
              <div class="cal-container">
                <span class="material-icons-outlined" aria-hidden="true">language</span>
                <div id="calmenu" class="cal-dropdown">
                  <div class="cal-dropdown-menu">
                    {hook h='displayNav3'}
                  </div>
                </div>
              </div>
            {/if}
            {hook h='displayNav4'}
          </div>
        </div>
        <div class="hidden-md-up text-sm-center mobile mobilecon">
          <div class="top-logo" id="_mobile_logo"></div>
          <div class="mobilezi">
            <div  id="menu-icon">
              <i class="material-icons d-inline">&#xE5D2;</i>
            </div>
							<div class="_desktop_nav_wishlist">
              <a href="{if $customer.is_logged}{$link->getModuleLink('blockwishlist', 'lists')}{else}{$link->getModuleLink('WishListModule','fcont')}{/if}">
                <div class="blockwishlist cart-preview">
                    <div class="header">
                      <span class="material-icons-outlined local_mall" aria-hidden="true">favorite_border</span>
                      <span class="cart-products-count" id="wishlist-p-count2">0</span>
                      <span class="cart-bubble rubber hide" id="wishlist-rubber2"></span>
                    </div>
                </div>
              </a>
            </div>

            <div class="nav-search-btn">
              <span class="material-icons-outlined" aria-hidden="true">search</span>
            </div>
          </div>
          <div class="mobilezi">
            <div id="_mobile_user_info"></div>
            {if count(Currency::getCurrencies(true))>1||count(Language::getLanguages(true))>1}
              <div class="cal-container">
                <span class="material-icons-outlined" aria-hidden="true">language</span>
                <div id="calmenu2" class="cal-dropdown">
                  <div class="cal-dropdown-menu">
                    {hook h='displayNav5'}
                  </div>
                </div>
              </div>
            {/if}
            <div id="_mobile_cart"></div>
          </div>

        </div>
      </div>
    </div>
    <div class="Menu_Principal">
          <div class="col-md-12 desklinks">
            {hook h='displayTop'}
          </div>
    </div>
  </nav>
{/block}


<div class="header-top2">
<div class="overlay-backdrop"></div>
      <div id="mobile_top_menu_wrapper" class="row hidden-md-up">
        <div class="drawer-heade-container">
          <div class="drawer-header">
            <div class="drawer-title">
              <span class="material-icons-outlined" hidden="" aria-hidden="true">menu</span>
              <span>Menu</span>
            </div>
            <button type="button" class="btn btn-square-small drawer-close-button js-drawer-close" aria-label="Close menu"
              title="Close menu">
              <span class="material-icons-outlined" aria-hidden="true">close</span>
            </button>
          </div>
        </div>
        <div class="js-top-menu mobile" id="_mobile_top_menu"></div>

        {* {hook h='displaydrawerlinks'} *}
        <div class="js-top-menu-bottom">
          {* <div id="_mobile_currency_selector"></div>
          <div id="_mobile_language_selector"></div> *}
          <div id="_mobile_contact_link">
            {hook h="displaySocialFollow"}
            
          </div>
        </div>
      </div>
      {* {hook h='displayTop'} *}
</div>
{if Module::getInstanceByName('prestahope_drawar') && Module::getInstanceByName('prestahope_drawar')->SHOW_CART_DRAWAR=='1'}
	<div id="side-cart">
		<div class="side-cart-overlay"></div>
		<div id="side-cart-wrapper" class="row">
			<div class="scwcon">
				<div class="side-cart-header">
					<a href="{$link->getPageLink('cart')}?action=show" class="cart-title">
						<span class="material-icons-outlined icon-width mr-1" aria-hidden="true">local_mall</span>
						<span class="scart-cp">Your cart <span class="scart-pc"><span></span>
					</a>
					<button type="button" class="btn btn-square-small cart-close-button" aria-label="Close menu" title="Close cart">
						<span class="material-icons-outlined" aria-hidden="true">close</span>
					</button>
				</div>
				<div class="side-cart-cont">
					<div class="card cart-container">
						<div class="loader-con">
							<span class="material-icons-outlined" aria-hidden="true" style=" animation: spin 2s linear infinite;font-size: 30px; ">cached</span>
						</div>
						<div>
							<div class="spinner-border" role="status">
								<span class="sr-only">{l s='Loading...' d='Shop.Theme.Actions'}</span>
							</div>
						</div>
						{* <hr class="separator"> *}
						{block name='cart_overview'}
							{include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
						{/block}
					</div>
				</div>
				<div class="side-cart-footer">{block name='cart_detailed_actions'}
					{if $cart.minimalPurchaseRequired}
							<p class="tax-ship">{l s='Minimal Purchase is ' d='Shop.Theme.Actions'} <strong>{$cart.minimalPurchaseRequired}</strong></p>
						{else}
							<p class="tax-ship">{l s='Taxes and shipping calculated at checkout' d='Shop.Theme.Actions'}</p>
					{/if}
					<div class="checkout cart-detailed-actions js-cart-detailed-actions card-block">
						{if $cart.minimalPurchaseRequired}
							<button disabled  class="btn btn-primary">
								{l s='Continue browsing' d='Shop.Theme.Actions'}
							</button>
						{elseif empty($cart.products) }
							<a href="/2-home" class="btn btn-primary">
								{l s='Continue browsing' d='Shop.Theme.Actions'}
							</a>
						{else}
							<div class="text-sm-center">
								<a href="{$urls.pages.order}" class="btn btn-primary ">
									<span class="material-icons-outlined local_mall" aria-hidden="true">lock</span>
									{l s='Check Out - ' d='Shop.Theme.Actions'}
									{if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
										{$currency.sign}{$cart.subtotals.products.amount}
									{else}
										{$currency.sign}{$cart.subtotals.products.amount}
									{/if}
								</a>
								{* <a href="{$urls.pages.order}" class="btn btn-primary">{l s='Proceed to checkout' d='Shop.Theme.Actions'}</a> *}
								{hook h='displayExpressCheckout'}
							</div>
						{/if}
					</div>
				{/block}</div>
			</div>
		</div>
	</div>
{/if}
{block name='header_top'}
  {hook h='displayNavFullWidth'}
{/block}
