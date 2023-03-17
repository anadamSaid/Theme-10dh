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
{if $breadcrumb.count>2}
    <a href="{$breadcrumb.links[$breadcrumb.count-2].url}" class="backbtn">
        <span class="bktobtnspn"><span class="material-icons-outlined" aria-hidden="true">arrow_back</span> {l s='Back to ' d='Admin.Actions'}{$breadcrumb.links[$breadcrumb.count-2].title}</span>
    </a>
{/if}
 <div class="reassurance">
 {hook h="displayreassurances"}

 {* {hook h="displayreassurance"} *}
</div>

<div class="Ftr_Pricipale">

<div class="Top_Footer">
<div class="Container_Top_Footer">
    <div>
        <h2 class="footer-social-title">{l s='Follow-us on social media!' d='Admin.Actions'}</h2>
    </div>
    <div>
        {hook h="displaySocialFollow"}
    </div>
</div>
</div>

<div class="footer-container">
<div class="container">

<div class="row content_footer_principale" >
<div class="Column_Information">
{if Module::getInstanceByName('prestahope_configuration')->footerAboutTitle}
    <h6 class="Big_Titels_Footer">{l s=Module::getInstanceByName('prestahope_configuration')->footerAboutTitle d='Admin.Actions'}</h6>
    <p class="footertextp">{l s=Module::getInstanceByName('prestahope_configuration')->footerAboutText d='Admin.Actions'}</p>
{/if}
<ul class="no-bullets site-footer__linklist "><li>
{block name='FooterEmail'}
{hook h='displayFooterEmail'}
{/block}
</li></ul>

</div>
<div class="Column_QuickLinks"> 
{block name='hook_footer'}
 {hook h='displayFooter'}
{/block}
</div>
<div class="Column_ContactEmail" >
<h6 class="Big_Titels_Footer">{l s='Subscribe to our newsletter!' d='Admin.Actions'}</h6>       
{block name='hook_footer_before'}
{hook h='displayFooterBefore'}
{/block}
</div>
</div>
</div>
</div>

<div class="bottom-footer">

<div class="Container_bottom_Footer ">
<div class=" container">
    <div class="row">
        {block name='copyright_link'}
        <a  class="col-md-6 col-xs-12 bottom_footer-social-title col" href="https://www.venvauktdev.com/" target="_blank" rel="noopener noreferrer nofollow">
            {l s='%copyright% %year% - Ecommerce software by %venvaukt%' sprintf=['%venvaukt%' => 'venvaukt™', '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}
        </a>
        {/block}
        <div class="col-md-6 col-xs-12 bottom_footer-social-title guaranteed-messagefooter" href="https://www.venvauktdev.com/" target="_blank" rel="noopener noreferrer nofollow">
            <div class="show-guaranteed-messagefooter">
                <img src="/modules/prestahope_paiements/views/img/1f4df4708a2e8501f0cb02a37b7a8fac8823f78712339f4cd255011988df7500.png" alt="image payment"/>
                {* {hook h='displayPaiements'} *}
            </div>
        </div>
    </div>
    </div>
</div>

<div class="ContainerbtnDropTop">
<button id="BtnDropToTop" class="BtnDropToTop">
<i class="material-icons-outlined">keyboard_arrow_up</i>
</button>
</div>
</div>
</div>
{hook h='displayThemeConfig'}
