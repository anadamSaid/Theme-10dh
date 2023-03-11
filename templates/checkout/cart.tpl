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

 {block name='content'}
   <section id="main">
     <div class="cart-grid row main-cart">
     <div class="card-block col-lg-12">
       <h1 class="h1 cart-h1">{l s='Your cart' d='Shop.Theme.Checkout'}</h1>
     </div>
       <!-- Left Block: cart product informations & shpping -->
       <div class="cart-grid-body col-lg-7">
 
         <!-- cart products detailed -->
         <div class="card cart-container">
           {block name='cart_overview'}
             {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
           {/block}
         </div>
 
         {* {block name='continue_shopping'}
           <a class="label" href="{$urls.pages.index}">
             <i class="material-icons">chevron_left</i>{l s='Continue shopping' d='Shop.Theme.Actions'}
           </a>
         {/block} *}
 
         <!-- shipping informations -->
         {block name='hook_shopping_cart_footer'}
           {hook h='displayShoppingCartFooter'}
         {/block}
       </div>
 
       <!-- Right Block: cart subtotal & cart total -->
       <div class="cart-grid-right col-lg-5 sticky-t-90">
 
         {block name='cart_summary'}
           <div class="card cart-summary">
 
             {block name='hook_shopping_cart'}
               {hook h='displayShoppingCart'}
             {/block}
             {block name='cart_totals'}
               {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
             {/block}
 
             {block name='cart_actions'}
               {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
             {/block}
 
           </div>
         {/block}
 
         {* {block name='hook_reassurance'}
           {hook h='displayReassurance'}
         {/block} *}
 
       </div>
 
     </div>
     
     {hook h='displayCrossSellingShoppingCart'}
     
   </section>
 {/block}
 