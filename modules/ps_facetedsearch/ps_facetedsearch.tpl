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
 {if isset($listing.rendered_facets)}
  <div class="filter-overlay hidden-md-up"></div>
  <div id="search_filters_wrapper">
    <div class="header">
      <div class="filter-title">
        <span><span class="material-icons-outlined icon-width" aria-hidden="true">filter_alt</span>{l s='Filter & Sort' d='Shop.Theme.Actions'}</span>
      </div>
      <button type="button" class="btn close-filter" aria-label="Close menu" title="Close menu">
        <span class="material-icons-outlined" aria-hidden="true">close</span>
      </button>
    </div>
    {* <span class="col-sm-3 col-md-3 hidden-sm-up sort-by">{l s='Sort by:' d='Shop.Theme.Global'}</span> *}
    <div class="products-sort-order dropdown hidden-sm-up">
      <button
        class="btn-unstyle select-title"
        rel="nofollow"
        data-toggle="dropdown"
        aria-label="{l s='Sort by selection' d='Shop.Theme.Global'}"
        aria-haspopup="true"
        aria-expanded="false">
        {if $listing.sort_selected}Sort by: {$listing.sort_selected}{else}{l s='Sort by' d='Shop.Theme.Actions'}{/if}
        <i class="material-icons float-xs-right">&#xE5C5;</i>
      </button>
      <div class="dropdown-menu">
        {foreach from=$listing.sort_orders item=sort_order}
          <a
            rel="nofollow"
            href="{$sort_order.url}"
            class="select-list {['current' => $sort_order.current, 'js-search-link' => true]|classnames}"
          >
            {$sort_order.label}
          </a>
        {/foreach}
      </div>
    </div>
      {* <div id="clear_all" class="clear-all-wrapper">
        <button data-search-url="{$clear_all_link}" class="btn btn-tertiary js-search-filters-clear-all">
          <i class="material-icons">&#xE14C;</i>
          {l s='Clear all' d='Shop.Theme.Actions'}
        </button>
      </div> *}
    {* <div id="search_filter_controls" class="hidden-md-up">
        <button class="btn btn-secondary ok">
          <i class="material-icons rtl-no-flip">&#xE876;</i>
          {l s='OK' d='Shop.Theme.Actions'}
        </button>
    </div> *}
    {$listing.rendered_facets nofilter}
  </div>
  {/if}
  