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
 
{block name='head_charset'}
  <meta charset="utf-8">
{/block}
{block name='head_ie_compatibility'}
  <meta http-equiv="x-ua-compatible" content="ie=edge">
{/block}

{block name='head_seo'}
  <title>{block name='head_seo_title'}{$page.meta.title}{/block}</title>
  {block name='hook_after_title_tag'}
    {hook h='displayAfterTitleTag'}
  {/block}
  <meta name="description" content="{block name='head_seo_description'}{$page.meta.description}{/block}">
  <meta name="keywords" content="{block name='head_seo_keywords'}{$page.meta.keywords}{/block}">
  {if $page.meta.robots !== 'index'}
    <meta name="robots" content="{$page.meta.robots}">
  {/if}
  {if $page.canonical}
    <link rel="canonical" href="{$page.canonical}">
  {/if}
  {block name='head_hreflang'}
    {foreach from=$urls.alternative_langs item=pageUrl key=code}
      <link rel="alternate" href="{$pageUrl}" hreflang="{$code}">
    {/foreach}
  {/block}
  {block name='head_microdata'}
    {include file="_partials/microdata/head-jsonld.tpl"}
  {/block}
  {block name='head_microdata_special'}{/block}
  {block name='head_pagination_seo'}
    {include file="_partials/pagination-seo.tpl"}
  {/block}
  {block name='head_open_graph'}
    <meta property="og:title" content="{$page.meta.title}" />
    <meta property="og:description" content="{$page.meta.description}" />
    <meta property="og:url" content="{$urls.current_url}" />
    <meta property="og:site_name" content="{$shop.name}" />
    {if !isset($product) && $page.page_name != 'product'}<meta property="og:type" content="website" />{/if}
  {/block}  
{/block}

{block name='head_viewport'}
  <meta name="viewport" content="width=device-width, initial-scale=1">
{/block}

{block name='head_icons'}
  <link rel="icon" type="image/vnd.microsoft.icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
  <link rel="shortcut icon" type="image/x-icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
  <link href="https://fonts.googleapis.com/css2?family=Material+Icons"
      rel="stylesheet">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- https://material.io/resources/icons/?style=outline -->
<link href="https://fonts.googleapis.com/css2?family=Material+Icons+Outlined"
      rel="stylesheet">

{* <!-- https://material.io/resources/icons/?style=round -->
<link href="https://fonts.googleapis.com/css2?family=Material+Icons+Round"
      rel="stylesheet">

<!-- https://material.io/resources/icons/?style=sharp -->
<link href="https://fonts.googleapis.com/css2?family=Material+Icons+Sharp"
      rel="stylesheet">

<!-- https://material.io/resources/icons/?style=twotone -->
<link href="https://fonts.googleapis.com/css2?family=Material+Icons+Two+Tone"
      rel="stylesheet"> *}
{/block}
{block name='stylesheets'}
  {include file="_partials/stylesheets.tpl" stylesheets=$stylesheets}
{/block}
{block name='javascript_head'}
  {include file="_partials/javascript.tpl" javascript=$javascript.head vars=$js_custom_vars}
  <script src="https://unpkg.com/tiny-swiper@latest/lib/index.min.js"></script>
  <script src="https://unpkg.com/tiny-swiper@latest/lib/modules/pagination.min.js"></script>
{/block}
{block name='hook_header'}
  {$HOOK_HEADER nofilter}
{/block}
{block name='hook_extra'}{/block}
{if isset(Module::getInstanceByName('prestahope_configuration')->themeKey)}
  <meta name="theme" content="{Module::getInstanceByName('prestahope_configuration')->themeKey}">
{/if}
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>