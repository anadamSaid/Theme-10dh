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

<div style="width:100%" id="blockEmailSubscription_{$hookName}">
  <div class="Container_Email">
    <p id="block-newsletter-label" class="col-md-5 col-xs-12">{l s='Get our latest news and special sales' d='Shop.Theme.Global'}</p>
    <div class="Subscribe_row_footer col-md-12 col-xs-12">
      <form class="" action="{$urls.current_url}#blockEmailSubscription_{$hookName}" method="post">
        <div class="row ">
           <div class="col-xs-12 input_email">
            
             <div class="input-wrapper email">
              {* <input
                name="Name"
                type="text"
                value="{$value}"
                placeholder="{l s='First Name' d='Shop.Forms.Labels'}"
                aria-labelledby="block-newsletter-label"
                required
              > *}
  
              
              <input
                name="email"
                type="email"
                value="{$value}"
                placeholder="{l s='Your email' d='Shop.Forms.Labels'}"
                aria-labelledby="block-newsletter-label"
                required
              >
            </div>
            
            <input
              class="btn btn-primary float-xs-right hidden-sm-up"
              name="submitNewsletter"
              type="submit"
              value="{l s='OK' d='Shop.Theme.Actions'}"
            >
            <button
              class="btn_Sub"
              name="submitNewsletter"
              type="submit"
              
            >
           
            <span class="material-icons-outlined" aria-hidden="true">email</span>
             {l s='Subscribe' d='Shop.Theme.Actions'}
               
            </button>
            <input type="hidden" name="blockHookName" value="{$hookName}" />
            <input type="hidden" name="action" value="0">
            <div class="clearfix"></div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
