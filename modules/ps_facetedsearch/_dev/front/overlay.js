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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 */

import './overlay.scss';

const template = `<div class="faceted-overlay">
<div class="overlay__inner">
<div class= class="overlay__content"><svg width="120" height="116" viewBox="0 0 120 116" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M110 58C110 47.5588 106.731 37.3795 100.652 28.8902C94.5736 20.401 85.9897 14.0278 76.1049 10.6647C66.2201 7.30158 55.5305 7.11736 45.5357 10.1379C35.5409 13.1584 26.7424 19.2321 20.3747 27.5068L28.2997 33.6055C33.3939 26.9857 40.4327 22.1267 48.4285 19.7103C56.4244 17.2939 64.9761 17.4413 72.8839 20.1317C80.7917 22.8222 87.6589 27.9208 92.522 34.7122C97.385 41.5036 100 49.647 100 58H110Z" fill="#111111"/>
<path d="M11.2873 50.2759C9.44954 61.8759 11.7538 73.7526 17.7962 83.8237C23.8386 93.8948 33.2334 101.517 44.3333 105.355C55.4333 109.193 67.53 109.001 78.5024 104.812C89.4749 100.624 98.6227 92.7067 104.342 82.4487L95.608 77.5789C91.0325 85.7853 83.7142 92.1191 74.9362 95.4698C66.1583 98.8205 56.4809 98.9743 47.6009 95.9041C38.721 92.8339 31.2052 86.7358 26.3713 78.679C21.5374 70.6221 19.6939 61.1207 21.1641 51.8407L11.2873 50.2759Z" fill="#111111"/>
<path d="M103.935 71.9431L93.4772 55.737L117.588 58.32L103.935 71.9431Z" fill="#111111"/>
<path d="M20.0354 38.5891L27.0498 56.5557L3.93894 49.2147L20.0354 38.5891Z" fill="#111111"/>
</svg></div>
</div>
</div>`;

function show() {
  if ($('.faceted-overlay').length === 1) {
    return;
  }

  $('body').append(template);
}

function hide() {
  $('.faceted-overlay').remove();
}

export {
  show as showOverlay,
  hide as hideOverlay,
};
