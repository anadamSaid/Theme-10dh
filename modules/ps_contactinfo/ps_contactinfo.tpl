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

 <h4 class="Big_Titels_Footer">{l s='Store information' d='Shop.Theme.Global'}</h4>

 <span class="material-icons-outlined" style=" font-size: 18px; ">place</span>
  {$contact_infos.address.formatted|replace:'<br />':' '}
 {if $contact_infos.phone}
  
  <br/>
  <span class="material-icons-outlined" style=" font-size: 18px; "> phone </span>
  <a href="tel:{$contact_infos.phone}">{$contact_infos.phone}</a>
 {/if}
 {if $contact_infos.fax}
 
  <br/>
  <span class="material-icons-outlined" style=" font-size: 18px; "> fax </span>
    {$contact_infos.fax}
    
 {/if}

{if $contact_infos.email && $display_email}

  <br/>
    <a href={$contact_infos.email} target="_blank" rel="noreferrer noopener" aria-label="Email:help@prestahope.com">
      <span class="material-icons-outlined icon-width" aria-hidden="true" style=" font-size: 18px; ">email</span>
    </a>
    {mailto address=$contact_infos.email encode="javascript"}
{/if}

