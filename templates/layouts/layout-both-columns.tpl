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

{include file='_partials/helpers.tpl'}

<!doctype html>
<html lang="{$language.locale}">

  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames}">
    {block name='hook_after_body_opening_tag'}
      {hook h='displayAfterBodyOpeningTag'}
    {/block}

    <main>
      {block name='product_activation'}
        {include file='catalog/_partials/product-activation.tpl'}
      {/block}
      {if $page.page_name != 'checkout'}
						{block name='header_banner'}
              <div class="header-banner">
                <div class="container topbarsfc">
                  <div class="fptdiv">
                  {hook h="displaySocialFollow"}
                  
                  </div>  
                  <p class="freestbp">{l s='Free shipping worldwide | 30-Day free returns' d='Shop.Theme.Global'}</p>
                  <div class="tbemailus">
                    <p><a href="mailto:{{Configuration::get('PS_SHOP_EMAIL')}}" target="_blank" rel="noreferrer noopener"><span class="gitwue">{l s='Get in touch with us' d='Shop.Theme.Global'}</span> <span class="material-icons-outlined" aria-hidden="true">email</span></a></p>
                  </div>
                </div>
              </div>
            {/block}
      {/if}
      {* <header id="header" class="{($page.page_name == 'index'&&Module::isEnabled('prestahope_categoryfeature'))?'':'stiky-top-0'}"> *}
      {if $page.page_name != 'checkout'}
        <header id="header" class="stiky-top-0">
          {block name='header'}
            {include file='_partials/header.tpl'}
          {/block}
        </header>
      {/if}
      {if $page.page_name == 'index'}
        <div id="slider-container">
          {hook h='displayHomeNavSlider'}
        </div>
          {hook h='displaycollectionshome' }
      {/if}
  
    
      <section id="wrapper">
        {block name='notifications'}
          {include file='_partials/notifications.tpl'}
        {/block}

        {hook h="displayWrapperTop"}
        {block name='breadcrumb'}
          {include file='_partials/breadcrumb.tpl'}
        {/block}
        <div class="container">

          <div class="row">
          {block name="category_column"}
            {* {$category|@var_dump} *}
            {if $page.page_name == 'category' && $category.image}
              <div id="category-column" class="col-xs-12">
                <div class="category-banner" style="background-image: url({$urls.base_url}img/c/{$category.id}.jpg)">
                </div>
                <h1 class="h1">{$category.name}</h1>
                {if $category.description}
                  <div id="category-description" class="text-muted">{$category.description nofilter}</div>
                {/if}
                </div>
              {elseif $page.page_name != 'checkout'}
                <div class="mt-2"></div>
              {/if}
          {/block}
          {if $page.page_name != 'best-sales' && $page.page_name != 'new-products' && $page.page_name != 'prices-drop'}
            {block name="left_column"}
              <div id="left-column" class="col-xs-12 col-sm-4 col-md-3">
                {if $page.page_name == 'product'}
                  {hook h='displayLeftColumnProduct' product=$product category=$category}
                {else}
                  {hook h="displayLeftColumn"}
                {/if}
              </div>
            {/block}
          {/if}
            {block name="content_wrapper"}
              <div id="content-wrapper" class="js-content-wrapper left-column right-column col-sm-4 col-md-6">
                {hook h="displayContentWrapperTop"}
                {block name="content"}
                  <p>Hello world! This is HTML5 Boilerplate.</p>
                {/block}
                {hook h="displayContentWrapperBottom"}
              </div>
            {/block}

            {block name="right_column"}
              <div id="right-column" class="col-xs-12 col-sm-4 col-md-3">
                {if $page.page_name == 'product'}
                  {hook h='displayRightColumnProduct'}
                {else}
                  {hook h="displayRightColumn"}
                {/if}
              </div>
            {/block}
          </div>
        </div>
        {hook h="displayWrapperBottom"}
      </section>
      {if $page.page_name != 'checkout'}
        {if $page.page_name == 'cart'}
          <a href="{$urls.pages.index}" class="backbtn">
              <span class="bktobtnspn"><span class="material-icons-outlined" aria-hidden="true">arrow_back</span> {l s='Continue shopping' d='Shop.Theme.Actions'}</span>
          </a>
        {/if}
      <footer id="footer" class="js-footer">
        {block name="footer"}
          {include file="_partials/footer.tpl"}
        {/block}
      </footer>
      {/if}

    </main>

    {block name='javascript_bottom'}
      {include file="_partials/password-policy-template.tpl"}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}
  </body>

</html>
