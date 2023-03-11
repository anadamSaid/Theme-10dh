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
 import $ from 'jquery';
 import prestashop from 'prestashop';
 
 function setUpCheckout() {
   $(prestashop.themeSelectors.checkout.termsLink).on('click', (event) => {
     event.preventDefault();
     let url = $(event.target).attr('href');
 
     if (url) {
       // TODO: Handle request if no pretty URL
       url += '?content_only=1';
       $.get(url, (content) => {
         $(prestashop.themeSelectors.modal)
           .find(prestashop.themeSelectors.modalContent)
           .html($(content).find('.page-cms').contents());
       }).fail((resp) => {
         prestashop.emit('handleError', {eventType: 'clickTerms', resp});
       });
     }
 
     $(prestashop.themeSelectors.modal).modal('show');
   });
 
   $(prestashop.themeSelectors.checkout.giftCheckbox).on('click', () => {
     $('#gift').slideToggle();
   });
 }
 
 function toggleImage() {
   // Arrow show/hide details Checkout page
   $(prestashop.themeSelectors.checkout.imagesLink).on('click', function () {
     const icon = $(this).find('i.material-icons');
 
     if (icon.text() === 'expand_more') {
       icon.text('expand_less');
     } else {
       icon.text('expand_more');
     }
   });
 }
 
 $(document).ready(() => {
  $('input').focus(function(){
    $(this).parent().find(".form-control-label").addClass('label-active');
  });

  $("input").focusout(function(){
    if ($(this).val() == '') {
      $(this).parent().find(".form-control-label").removeClass('label-active');
    };
  });
 if($("#checkout").length){
   setInterval(() => {
     $("#vv-c-header-price h2").text($("#js-checkout-summary .cart-total .value")[0].innerText);
    }, 1500);
  }

  $(".vv-c-header-content").click(function(){
      $(".checkoutsummarycont").toggleClass("checkoutsummarycont-open")
      $(".aroowdnup").toggleClass("aroowdndn")
  })
  
  
   var generate  = function(){
     var checkoutSteps = document.querySelectorAll(".vv_step")
     var ul =  document.getElementById("vv-nav-steps")
     var overCurrent = false;
     for (let index = 0; index < checkoutSteps.length; index++) {
         const step = checkoutSteps[index];
         var stepName = step.attributes['data-step'].value;
         var li = document.createElement("li");
         li.appendChild(document.createTextNode(step.innerText));
         if(stepName== "current_step"){
             li.classList.add('current_step')
             overCurrent = true
         }else if(stepName== "unreachable_step"){  
           li.classList.add('not_done_step')
         }
         else{   
             li.classList.add('done_step')
             li.dataset.position = step.attributes['data-position'].value;
         };
         ul.appendChild(li);
     }
 }
 generate();
 var goBackSteps = document.querySelectorAll(".done_step")
 var allSteps = document.querySelectorAll("#vv-nav-steps li")
 for (let index = 0; index < goBackSteps.length; index++) {
     goBackSteps[index].addEventListener('click', function(event) {
         event.preventDefault();
         if (goBackSteps[index].attributes['data-position'].value == 1) {
            document.getElementById("checkout-personal-information-step").click()
            event.target.classList.add('current_step')
            allSteps[0].classList.remove('done_step')
            allSteps[1].classList.remove('done_step','current_step')
            allSteps[2].classList.remove('done_step','current_step')
            allSteps[3].classList.remove('done_step','current_step')
         }else if (goBackSteps[index].attributes['data-position'].value == 2) {
           (event.target.classList.contains('done_step'))?event.target.classList.add('current_step'):true;
            document.getElementById("checkout-addresses-step").click()
            allSteps[1].classList.remove('done_step')
            allSteps[2].classList.remove('done_step','current_step')
            allSteps[3].classList.remove('done_step','current_step')
         }
         else if (goBackSteps[index].attributes['data-position'].value == 3) {
           (event.target.classList.contains('done_step'))?event.target.classList.add('current_step'):true;
            document.getElementById("checkout-delivery-step").click()
            allSteps[2].classList.remove('done_step')
            allSteps[3].classList.remove('done_step','current_step')
         }
     });
 }
     
 
   if ($('body#checkout').length === 1) {
     setUpCheckout();
     toggleImage();
   }
 
   prestashop.on('updatedDeliveryForm', (params) => {
     if (typeof params.deliveryOption === 'undefined' || params.deliveryOption.length === 0) {
       return;
     }
     // Hide all carrier extra content ...
     $(prestashop.themeSelectors.checkout.carrierExtraContent).hide();
     // and show the one related to the selected carrier
     params.deliveryOption.next(prestashop.themeSelectors.checkout.carrierExtraContent).slideDown();
   });

  
 });
 