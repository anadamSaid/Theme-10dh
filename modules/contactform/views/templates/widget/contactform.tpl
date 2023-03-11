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
 {* {$contact|@var_dump} *}
<section class="contact-form">
<form id="form_ContactUs" action="{$urls.pages.contact}" method="post" {if $contact.allow_file_upload}enctype="multipart/form-data"{/if}>
  {if $notifications}
    <div class="col-xs-12 alert {if $notifications.nw_error}alert-danger{else}alert-success{/if}">
      <ul>
        {foreach $notifications.messages as $notif}
          <li>{$notif}</li>
        {/foreach}
      </ul>
    </div>
  {/if}

  {if !$notifications || $notifications.nw_error}
    <section class="form-fields">

      <div class="form-group row">
        <div class="Center col-md-12 col-md-offset-3">
          <h3 class="Page-Titel">{l s='Contact' d='Shop.Theme.Global'}</h3>
        </div>
      </div>

      <div class="Forms-Two-Fields">



       <div class="form-group row">

       
        <label class="col-md-12 form-control-label" for="Name">{l s='Name' d='Shop.Forms.Labels'}</label>
          <input
            id="Name"
            class="form-control"
            name="name"
            type="Text"
            placeholder="{l s='Name' d='Shop.Forms.Help'}"
          >
        </div>

      <div class="form-group row">
       
        <label class="col-md-12 form-control-label" for="email">{l s='Email *' d='Shop.Forms.Labels'}</label>
          <input
            id="email"
            class="form-control"
            name="from"
            type="email"
            value="{$contact.email}"
            placeholder="{l s='Email' d='Shop.Forms.Help'}"
            required
          >
      </div>
      
           
      
      </div>

       <div class="form-group row">
        <label class="col-md-12 form-control-label" for="Mobile">{l s='Phone Number' d='Shop.Forms.Labels'}</label>
          <input
            id="Mobile"
            class="form-control"
            name="phone"
            type="Mobile"
            placeholder="{l s='Phone Number' d='Shop.Forms.Help'}"
          >
      </div>
      <input type="hidden" name="id_contact" id="id_contact" value="1">

      <div class="Forms-Two-Fields Forms-Two-Fields2">

        <div class="form-group row ">
          <label class="col-md-12 form-control-label" for="id-order">{l s='Order reference' d='Shop.Forms.Labels'}</label>
            <select id="id-order" name="id_order" class="form-control form-control-select">
              <option value="">{l s='Select reference' d='Shop.Forms.Help'}</option>
              {foreach from=$contact.orders item=order}
                <option value="{$order.id_order}">{$order.reference}</option>
              {/foreach}
            </select>
 
        </div>
       

        
        {if $contact.allow_file_upload}
          <div class="form-group row">
            <label class="col-md-12 form-control-label" for="file-upload">{l s='Attachment' d='Shop.Forms.Labels'}</label>
              <input id="file-upload" type="file" name="fileUpload" class="filestyle" data-buttonText="{l s='Choose file' d='Shop.Theme.Actions'}">
          </div>
        {/if}

      </div>

      <div class="form-group row">
        <label class="col-md-12 form-control-label" for="contactform-message">{l s='Message' d='Shop.Forms.Labels'}</label>
          <textarea
            id="contactform-message"
            class="form-control"
            name="message"
            placeholder="{l s='Message' d='Shop.Forms.Help'}"
            rows="3"
          >{if $contact.message}{$contact.message}{/if}</textarea>
      </div>

      {if isset($id_module)}
        <div class="form-group row">
          <div class="offset-md-3">
            {hook h='displayGDPRConsent' id_module=$id_module}
          </div>
        </div>
      {/if}

    </section>

    <footer class="formContact-footer"> 
      <style>
        input[name=url] {
          display: none !important;
        }
      </style>
      <input type="text" name="url" value=""/>
      <input type="hidden" name="token" value="{$token}" />
      <button class="btn btn-send-form" type="submit" name="submitMessage">
      {l s='Send' d='Shop.Theme.Actions'}<span class="material-icons-outlined">arrow_right_alt</span>
      </button>

    </footer>
  {/if}

</form>
</section>