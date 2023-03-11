/**
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
 */
import prestashop from 'prestashop';
import $ from 'jquery';

$('#_desktop_cart,#_mobile_cart,#_product_cart').on('click', () => {
		if($('.cdsohfm').length){
			$('body').toggleClass('drawer-is-open');
			$('#side-cart-wrapper').toggleClass("side-cart-open");
			$('.side-cart-overlay').show();
			$('.scart-pc').text('('+prestashop.cart.products_count+')');
		}else{
		}
	});

$('.side-cart-overlay,.cart-close-button').on('click', () => {
  $('body').removeClass('drawer-is-open');
  $('#side-cart-wrapper').removeClass("side-cart-open");
  $('.side-cart-overlay').hide();
});

prestashop.blockcart = prestashop.blockcart || {};

prestashop.blockcart.showModal = (html) => {
  function getBlockCartModal() {
    return $('#blockcart-modal');
  }

  let $blockCartModal = getBlockCartModal();

  if ($blockCartModal.length) {
    $blockCartModal.remove();
  }

  $('body').append(html);

  $blockCartModal = getBlockCartModal();
  $blockCartModal.modal('show').on('hidden.bs.modal', (event) => {
    prestashop.emit('updateProduct', {
      reason: event.currentTarget.dataset,
      event,
    });
  });
  setTimeout(() => {
    $blockCartModal.remove();
  }, 5000);
};
