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

{assign var='icon' value=$icon|default:'check_circle'}
{assign var='modal_message' value=$modal_message|default:''}

<script type="text/javascript">
  document.addEventListener("DOMContentLoaded", function() {
    const alertModal = $('#{$modal_id}');
    console.log(alertModal)
    alertModal.on('hidden.bs.modal', function () {
      alertModal.modal('hide');
      });
      setTimeout(() => {
      alertModal.remove();
      alertModal.modal('hide');
    }, 5000);
  });
</script>

<div id="{$modal_id}" class=" fade ">
  
<div id="blockcart-modal" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: block;">
<div class="modal-dialog" role="document">
  <div class="modal-content">
   
    <div class="modal-body">
      <div class="row">
        <div class="col-md-12 mdcc">
          <div class="cart-content">
          
            
            <div class="cart-content-btn modal-cart-btn">
                              <p>{$modal_message}</p>
              </div>
            <button type="button" class="modal-cart-close" data-dismiss="modal" aria-label="Close">
              <span class="material-icons-outlined" aria-hidden="true">close</span>
            </button>
          </div>
        </div>
      </div>
    </div>
    
  </div>
</div>
</div>
     
</div>
