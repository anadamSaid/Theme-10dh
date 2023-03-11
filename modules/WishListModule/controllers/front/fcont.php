<?php

use PrestaShop\PrestaShop\Core\Module\WidgetInterface;
use PrestaShop\PrestaShop\Adapter\Image\ImageRetriever;
use PrestaShop\PrestaShop\Adapter\Product\PriceFormatter;
use PrestaShop\PrestaShop\Core\Product\ProductListingPresenter;
use PrestaShop\PrestaShop\Adapter\Product\ProductColorsRetriever;
use PrestaShop\Module\BlockWishList\Access\CustomerAccess;

if (!defined('_PS_VERSION_'))
        exit;


class WishListModulefcontModuleFrontController extends ModuleFrontController 
{

    public function __construct()
    {
      parent::__construct();    
    }

    public function initContent()
    {
            parent::initContent();
                $this->context->smarty->assign(
                  array(
                    'idListProducts' => (isset($_GET["idListProducts"]))?$_GET["idListProducts"]:false,
                     // Retrieved from GET vars
                  ));
                
           
                $this->setTemplate('module:WishListModule/views/templates/front/Page_WishList.tpl');
                $this->context->link->getModuleLink('WishListModule','fcont',array('idListProducts'));

    }

    



}


