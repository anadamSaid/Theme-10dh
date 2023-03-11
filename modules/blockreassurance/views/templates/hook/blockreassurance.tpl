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
{* {if $block['type_link'] !== $LINK_TYPE_NONE && !empty($block['link'])}  style="cursor:pointer;"  onclick="window.open('{$block['link']}')"{/if} *}
{* <img {if $block['is_svg'] }class="svg invisible" {/if} src="{$elements.custom_icon}"> *}
 


{if $elements}

  <div class="container">



        <div id="element-reassurance" >
          <ul class="blockreassurance_product row" >
            {foreach from=$elements item=element}
              <li class="itemes col-lg-{if count($elements) >= 4}3{elseif count($elements)==3}4{elseif count($elements)==2}6{else}12{/if} col-md-{if count($elements) > 2 }6{else}12{/if} col-sm-{if count($elements) > 2 }6{else}12{/if} col-xs-{if count($elements) > 2 }6{else}12{/if}" >
                <div class="element-reassurance-item">
                  <img class="reassurance_Image" src="{$element.image}" alt="{$element.text}" loading="lazy">
                  <span class="reassurance-title" >{$element.title}</span>
                  <p class="reassurance-description">{$element.description}</p>
                </div>
              </li>
            {/foreach}
          </ul>
        </div>

      </div>


{/if}

  











