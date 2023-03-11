{**
 * 2007-2020 PrestaShop SA and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
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
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div class='col-md-8'>
    <div class="search_wdg search_wdg_open">
        <div id="search_widget" class="search-widgets" data-search-controller-url="{$search_controller_url}">
            <form id="searchbarid" method="get" action="{$search_controller_url}" >
                <input type="hidden" name="controller" value="search" required>
                <div class="searchbachhs">
                    <input id="search-autofocus"  type="text" name="s" value="{$search_string}" required placeholder="{l s='Search our catalog' d='Shop.Theme.Catalog'}" aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
                    <button id="loadingbtnind" aria-label="search bar" class="search" type="submit"> 
                        <i id="hide-on-loading" class="material-icons "  aria-hidden="true">search</i>
                    </button>
                </div>
                <i class="material-icons clear" aria-hidden="true" style="display: none;">clear</i>
            </form>
        </div>
    </div>
</div>