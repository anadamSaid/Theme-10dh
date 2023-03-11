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
<div id="blockcart-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
     
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12 mdcc">
            <div class="cart-content">
            
              {hook h='displayCartModalContent' product=$product}
              <div class="cart-content-btn modal-cart-btn">
                {* <button type="button" class="btn btn-secondary" data-dismiss="modal">{l s='Continue shopping' d='Shop.Theme.Actions'}</button> *}
                <p>{l s='Item has been added' d='Shop.Theme.Actions'}</p>
                <button id="_product_cart" class="btn btn-primary">{l s='View Cart' d='Shop.Theme.Actions'}</a>
              </div>
              <button type="button" class="modal-cart-close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
                <span class="material-icons-outlined" aria-hidden="true">close</span>
              </button>
            </div>
          </div>
        </div>
      </div>
      {hook h='displayCartModalFooter' product=$product}
    </div>
  </div>
  <script>
  $('#_product_cart').on('click', () => {
    let $blockCartModal = $('#blockcart-modal');

    if ($blockCartModal.length) {
      $blockCartModal.remove();
    }
    $('body').toggleClass('drawer-is-open');
    $('#side-cart-wrapper').toggleClass("side-cart-open");
    $('.side-cart-overlay').show();
    $('.scart-pc').text('('+prestashop.cart.products_count+')');
  });
  </script>
</div>