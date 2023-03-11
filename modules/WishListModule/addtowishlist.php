<?php
/**
* offer of the day
 *
 * NOTICE OF LICENSE
 * This Licence is only valid for one installation, you can sell it to
 * your customer and personalize it, but you can't install more than one
 * Licences, to install more licences buy another licences first.
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    venvaukt
 * @copyright venvaukt
*  @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * @version 1.0.0
 * @category product
 * Registered Trademark & Property of venvaukt.com
*/


require(dirname(__FILE__).'/../../config/config.inc.php');
require(dirname(__FILE__).'/WishListModule.php');
header('Content-Type: application/json');
$pv = new WishListModule();

if(preg_match('~[0-9]+|,~', $_GET["idcostumer"]) && preg_match('~[0-9]+|,~', $_GET["productIds"]) && preg_match('~[0-9]+|,~', $_GET["productsquantity"]) && preg_match('~[0-9]+|,~', $_GET["productsattributs"]) ){
  
  
    $IdCostumer = $_GET["idcostumer"] ;
    
    $idWishList = $pv->getIdWishList($IdCostumer); 

    $OurProductId = array_map('intval', explode(',', $_GET["productIds"]));
    $OurProductQts = array_map('intval', explode(',', $_GET["productsquantity"]));
    $OurProductIsAttr = array_map('intval', explode(',', $_GET["productsattributs"]));

    for ($i=0; $i < count($OurProductId) ; $i++) { 
        $pv->addProduct($idWishList,$IdCostumer,$OurProductId[$i],$OurProductIsAttr[$i],$OurProductQts);
    }


}






















