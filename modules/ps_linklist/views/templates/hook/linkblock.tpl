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
{if $linkBlocks}
 <h3 class="Big_Titels_Footer">{$linkBlocks[0]['title']}</h3>
  <div class="List_Of_Links">
  <div class="links">
    <div class="ListLinks">


    {assign var=counter value=0}

    {foreach $linkBlocks as $linkBlock}

    <ul id="footer_sub_menu_{$linkBlock.id}" class="collapse in">
    
          {assign var=counter2 value=0}

          {foreach $linkBlock.links as $link}

          {if $counter == 0 || ($counter==1 && ($counter2==1 || $counter2==2 ||  $counter2==5)  )}
            <li>
              <a
                  id="{$link.id}-{$linkBlock.id}"
                  class="{$link.class}"
                  href="{$link.url}"
                  title="{$link.description}"
                  {if !empty($link.target)} target="{$link.target}" {/if}
              >
                {$link.title}
              </a>
            </li>
          {/if}
    
          {assign var=counter2 value=$counter2+1}
          {/foreach}
          {assign var=counter value=$counter+1}
        </ul>       
    {/foreach}
    </div>
  </div>
  </div>
{/if}