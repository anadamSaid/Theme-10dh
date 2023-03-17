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
<div id="_desktop_user_info">
  <div class="user-info">
  <ul id="CtmAccountMenu" class="cstdropdown-menu dropdown-parent">
{if $logged}
    <a href="{$urls.pages.my_account}" class="dropdown-item" rel="nofollow">
      <li class="dropdown-link">
        <i class="material-icons">&#xE7FF;</i>
        <span class="ddmispn">{l s='My Account' d='Shop.Theme.Actions'}</span>
      </li>
    </a>
    <a href="{$urls.actions.logout}" class="dropdown-item" rel="nofollow">
      <li class="dropdown-link">
        <span class="material-icons-outlined icon-width">exit_to_app</span>
        <span class="ddmispn">{l s='Sign out' d='Shop.Theme.Actions'}</span>
      </li>
    </a>
{else}
      <a href="{$urls.pages.authentication}?back={$urls.current_url|urlencode}" class="dropdown-item">
        <li class="dropdown-link">
          <span class="material-icons-outlined icon-width">exit_to_app</span>
          <span class="ddmispn">{l s='Log In' d='Shop.Theme.Actions'}</span>
        </li>
      </a>
      <a href="{$urls.pages.register}?back={$urls.current_url|urlencode}" class="dropdown-item">
        <li class="dropdown-link">
          <span class="material-icons-outlined icon-width">person_add</span>
          <span class="ddmispn">{l s='Create Account' d='Shop.Theme.Actions'}</span>
        </li>
      </a>
{/if}
   </ul>

      <div
      class="loginbtn"
        {* href="{$urls.pages.authentication}?back={$urls.current_url|urlencode}" *}
        title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
        {* rel="nofollow" *}
        class="login"
      >
      {* {if $logged}
        <span class="hidden-sm-down">{$customerName}</span>
      {/if} *}
        <i class="material-icons">&#xE7FF;</i>
      </div>
  </div>
</div>
