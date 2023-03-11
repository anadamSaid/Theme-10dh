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
{extends file='customer/page.tpl'}

{block name='page_title'}
{l s='Your addresses' d='Shop.Theme.Customeraccount'}{if $customer.addresses}({count($customer.addresses)}){else}(0){/if}
{/block}

  {block name='page_content'}
  <div class="container Container_Btn_Add_Adresses ">
    <a class="col-lg-3 col-md-10 col-sm-10 col-xs-12" href="{$urls.pages.address}" data-link-action="add-address">
              <span>{l s='Add new address' d='Shop.Theme.Actions'}</span>
    </a>    
  </div>
  {if $customer.addresses}
  <div class="container">
  {foreach $customer.addresses as $address}         
        <div class="col-lg-4 col-md-6 col-sm-6">
        {block name='customer_address'}
          {include file='customer/_partials/block-address.tpl' address=$address}
        {/block}
        </div>       
  {/foreach}
  </div>
  {else}
    <div class="alert alert-info" role="alert" data-alert="info">
      {l s='No addresses are available.' d='Shop.Notifications.Success'} <a href="{$urls.pages.address}" title="{l s='Add a new address' d='Shop.Theme.Actions'}">{l s='Add a new address' d='Shop.Theme.Actions'}</a>
    </div>
  {/if}
  <div class="clearfix"></div>
  
  
{/block}



{* how to count the Addresse we use function count($customer.addresses) *}
