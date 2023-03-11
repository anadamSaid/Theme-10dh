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

function initRmaItemSelector() {
  $(`${prestashop.themeSelectors.order.returnForm} table thead input[type=checkbox]`).on('click', function () {
    const checked = $(this).prop('checked');
    $(`${prestashop.themeSelectors.order.returnForm} table tbody input[type=checkbox]`).each((_, checkbox) => {
      $(checkbox).prop('checked', checked);
    });
  });
}

function setupCustomerScripts() {
  if ($('body#order-detail')) {
    initRmaItemSelector();
  }
}

$(document).ready(setupCustomerScripts);
$( document ).ready(function() {
  
  var hoverTimeout;
  $('.user-info').hover(function() {
    clearTimeout(hoverTimeout);
    $('#CtmAccountMenu').removeClass('cstdropdown-open');
    $('#CtmAccountMenu').addClass('cstdropdown-open');
  },function() {
    hoverTimeout = setTimeout(function() {
      $('#CtmAccountMenu').removeClass('cstdropdown-open');
    },150);
  });
  var hoverTimeout3;
  $('#_desktop_user_info .user-info').hover(function() {
    clearTimeout(hoverTimeout3);
    $('#_desktop_user_info #CtmAccountMenu').removeClass('cstdropdown-open');
    $('#_desktop_user_info #CtmAccountMenu').addClass('cstdropdown-open');
  },function() {
    hoverTimeout3 = setTimeout(function() {
      $('#_desktop_user_info #CtmAccountMenu').removeClass('cstdropdown-open');
    },150);
  });
  var hoverTimeout2;
  $('.cal-container').hover(function() {
    clearTimeout(hoverTimeout2);
    $('#calmenu').removeClass('cal-dropdown-open');
    $('#calmenu2').removeClass('cal-dropdown-open');
    $('#calmenu2').addClass('cal-dropdown-open');
    $('#calmenu').addClass('cal-dropdown-open');
  },function() {
    hoverTimeout2 = setTimeout(function() {
      $('#calmenu').removeClass('cal-dropdown-open');
      $('#calmenu2').removeClass('cal-dropdown-open');
    },150);
  });
  $('.nav-search-btn').click(function() {
    $('.search_wdg').addClass('search_wdg_open');
    $('.search-overlay-backdrop').addClass('search-overlay-open');
    $('body').toggleClass('drawer-is-open');
    document.getElementById('search-autofocus').focus();
  });
	$('#searchbarid .clear').click(function() {
    document.getElementById('search-autofocus').focus();
  });
  $('.search-overlay-backdrop').click(function() {
    $('.search_wdg').removeClass('search_wdg_open');
    $('.search-overlay-backdrop').removeClass('search-overlay-open');
    $('body').removeClass('drawer-is-open');

  });
  $('.searchbar-toggler').click(function() {
    $('.search_wdg').removeClass('search_wdg_open');
    $('.search-overlay-backdrop').removeClass('search-overlay-open');
    $('body').removeClass('drawer-is-open');

  });
  // var form = document.getElementById("searchbarid");
  // document.getElementById("searchbaridclick").addEventListener("click", function () {
  //   form.submit();
  // });
});

jQuery(document).ready(function ($) {
  var homesliderConfig = {
    speed: 500,            // Integer: Speed of the transition, in milliseconds
    timeout: $('.homeslider-container').data('interval'), // Integer: Time between slide transitions, in milliseconds
    nav: true,             // Boolean: Show navigation, true or false
    random: false,          // Boolean: Randomize the order of the slides, true or false
    pause: $('.homeslider-container').data('pause'), // Boolean: Pause on hover, true or false
    maxwidth: "",           // Integer: Max-width of the slideshow, in pixels
    namespace: "homeslider",   // String: Change the default namespace used
    before: function(){},   // Function: Before callback
    after: function(){}     // Function: After callback
  };

  $(".rslides").responsiveSlides(homesliderConfig);

});

/*! http://responsiveslides.com v1.54 by @viljamis */
(function(c,I,B){c.fn.responsiveSlides=function(l){var a=c.extend({auto:!0,speed:500,timeout:4E3,pager:!1,nav:!1,random:!1,pause:!1,pauseControls:!0,prevText:"Previous",nextText:"Next",maxwidth:"",navContainer:"",manualControls:"",namespace:"rslides",before:c.noop,after:c.noop},l);return this.each(function(){B++;var f=c(this),s,r,t,m,p,q,n=0,e=f.children(),C=e.size(),h=parseFloat(a.speed),D=parseFloat(a.timeout),u=parseFloat(a.maxwidth),g=a.namespace,d=g+B,E=g+"_nav "+d+"_nav",v=g+"_here",j=d+"_on",
w=d+"_s",k=c("<ul class='"+g+"_tabs "+d+"_tabs' />"),x={"float":"left",position:"relative",opacity:1,zIndex:2},y={"float":"none",position:"absolute",opacity:0,zIndex:1},F=function(){var b=(document.body||document.documentElement).style,a="transition";if("string"===typeof b[a])return!0;s=["Moz","Webkit","Khtml","O","ms"];var a=a.charAt(0).toUpperCase()+a.substr(1),c;for(c=0;c<s.length;c++)if("string"===typeof b[s[c]+a])return!0;return!1}(),z=function(b){a.before(b);F?(e.removeClass(j).css(y).eq(b).addClass(j).css(x),
n=b,setTimeout(function(){a.after(b)},h)):e.stop().fadeOut(h,function(){c(this).removeClass(j).css(y).css("opacity",1)}).eq(b).fadeIn(h,function(){c(this).addClass(j).css(x);a.after(b);n=b})};a.random&&(e.sort(function(){return Math.round(Math.random())-0.5}),f.empty().append(e));e.each(function(a){this.id=w+a});f.addClass(g+" "+d);l&&l.maxwidth&&f.css("max-width",u);e.hide().css(y).eq(0).addClass(j).css(x).show();F&&e.show().css({"-webkit-transition":"opacity "+h+"ms ease-in-out","-moz-transition":"opacity "+
h+"ms ease-in-out","-o-transition":"opacity "+h+"ms ease-in-out",transition:"opacity "+h+"ms ease-in-out"});if(1<e.size()){if(D<h+100)return;if(a.pager&&!a.manualControls){var A=[];e.each(function(a){a+=1;A+="<li><a href='#' class='"+w+a+"'>"+a+"</a></li>"});k.append(A);l.navContainer?c(a.navContainer).append(k):f.after(k)}a.manualControls&&(k=c(a.manualControls),k.addClass(g+"_tabs "+d+"_tabs"));(a.pager||a.manualControls)&&k.find("li").each(function(a){c(this).addClass(w+(a+1))});if(a.pager||a.manualControls)q=
k.find("a"),r=function(a){q.closest("li").removeClass(v).eq(a).addClass(v)};a.auto&&(t=function(){p=setInterval(function(){e.stop(!0,!0);var b=n+1<C?n+1:0;(a.pager||a.manualControls)&&r(b);z(b)},D)},t());m=function(){a.auto&&(clearInterval(p),t())};a.pause&&f.hover(function(){clearInterval(p)},function(){m()});if(a.pager||a.manualControls)q.bind("click",function(b){b.preventDefault();a.pauseControls||m();b=q.index(this);n===b||c("."+j).queue("fx").length||(r(b),z(b))}).eq(0).closest("li").addClass(v),
a.pauseControls&&q.hover(function(){clearInterval(p)},function(){m()});if(a.nav){g="<a href='#' class='"+E+" prev'>"+a.prevText+"</a><a href='#' class='"+E+" next'>"+a.nextText+"</a>";l.navContainer?c(a.navContainer).append(g):f.after(g);var d=c("."+d+"_nav"),G=d.filter(".prev");d.bind("click",function(b){b.preventDefault();b=c("."+j);if(!b.queue("fx").length){var d=e.index(b);b=d-1;d=d+1<C?n+1:0;z(c(this)[0]===G[0]?b:d);if(a.pager||a.manualControls)r(c(this)[0]===G[0]?b:d);a.pauseControls||m()}});
a.pauseControls&&d.hover(function(){clearInterval(p)},function(){m()})}}if("undefined"===typeof document.body.style.maxWidth&&l.maxwidth){var H=function(){f.css("width","100%");f.width()>u&&f.css("width",u)};H();c(I).bind("resize",function(){H()})}})}})(jQuery,this,0);
