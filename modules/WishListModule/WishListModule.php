<?php
/**
* 2007-2022 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2022 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_PS_VERSION_')) {
    exit;
}
use PrestaShop\PrestaShop\Core\Module\WidgetInterface;
use PrestaShop\PrestaShop\Adapter\Image\ImageRetriever;
use PrestaShop\PrestaShop\Adapter\Product\PriceFormatter;
use PrestaShop\PrestaShop\Core\Product\ProductListingPresenter;
use PrestaShop\PrestaShop\Adapter\Product\ProductColorsRetriever;
use PrestaShop\Module\BlockWishList\Access\CustomerAccess;

class WishListModule extends Module
{
    protected $config_form = false;

    public function __construct()
    {
        $this->name = 'WishListModule';
        $this->tab = 'others';
        $this->version = '1.0.0';
        $this->author = 'VenVAukt';
        $this->need_instance = 1;

        /**
         * Set $this->bootstrap to true if your module is compliant with bootstrap (PrestaShop 1.6)
         */
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('WishListModule');
        $this->description = $this->l('we use this module f');

        $this->confirmUninstall = $this->l('');

        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
    }

    public function getSpecialProducts(array $OurProduct)
    {        
        $myArray = array();
        for ($i=0; $i < count($OurProduct) ; $i++) { 
            $product= new Product($OurProduct[$i]);
            $context = Context::getContext();
            $id_lang = Context::getContext()->language->id;
            $productImages = $product->getImages((int) $id_lang);
            $link = new Link;
            $imagePath = $link->getImageLink($product->link_rewrite[Context::getContext()->language->id], $productImages[0]['id_image'], 'home_default');
            $product->image = $imagePath;
            $product->url = Context::getContext()->link->getProductLink($OurProduct[$i]);
            array_push( $myArray,$product); 
        }
        echo json_encode($myArray);
    }

    public static function addProduct($id_wishlist, $id_customer, $id_product, $id_product_attribute, $quantity)
    {
        $result = Db::getInstance()->getRow('
            SELECT wp.`quantity`
                FROM `' . _DB_PREFIX_ . 'wishlist_product` wp
            JOIN `' . _DB_PREFIX_ . 'wishlist` w ON (w.`id_wishlist` = wp.`id_wishlist`)
            WHERE wp.`id_wishlist` = ' . (int) $id_wishlist . '
            AND w.`id_customer` = ' . (int) $id_customer . '
            AND wp.`id_product` = ' . (int) $id_product . '
            AND wp.`id_product_attribute` = ' . (int) ($id_product_attribute)
        );

        if (!empty($result)) {
            if ((int) $result['quantity'] + (int) $quantity <= 0) {
                return WishList::removeProduct($id_wishlist, $id_customer, $id_product, $id_product_attribute);
            }

            // TODO: use a method for this like updateProduct ?
            return Db::getInstance()->update(
                'wishlist_product',
                [
                    'quantity' => (int) $quantity + (int) $result['quantity'],
                ],
                '`id_wishlist` = ' . (int) $id_wishlist . ' AND `id_product` = ' . (int) $id_product . ' AND `id_product_attribute` = ' . (int) $id_product_attribute
            );
        }

        return Db::getInstance()->insert(
            'wishlist_product',
            [
                'id_wishlist' => (int) $id_wishlist,
                'id_product' => (int) $id_product,
                'id_product_attribute' => (int) $id_product_attribute,
                'quantity' => (int) $quantity,
                'priority' => 1,
            ]
        );
    }

    public function getIdWishList($id_customer){

        $query = 'SELECT id_wishlist FROM `'._DB_PREFIX_.'wishlist` WHERE `id_customer`='.$id_customer;
        $WishListes = Db::getInstance()->executeS($query);
        $NumberOfWishListes = count($WishListes);

        if($NumberOfWishListes == 1){
            $query = 'SELECT id_wishlist FROM `'._DB_PREFIX_.'wishlist` WHERE `id_customer`='.$id_customer;
            $WishListes = Db::getInstance()->getRow($query);
            return $WishListes["id_wishlist"] ;
        }else{
              $query2 = 'SELECT id_wishlist FROM `'._DB_PREFIX_.'wishlist` WHERE `name`="WishListTest" ';
              $WishListes2 = Db::getInstance()->executeS($query2);
              $NumberOfWishListeswithName = count($WishListes2);

              if($NumberOfWishListeswithName != 0 ) 
              {
                $query2 = 'SELECT id_wishlist FROM `'._DB_PREFIX_.'wishlist` WHERE `name`="WishListTest" ';
                $WishListes2 = Db::getInstance()->getRow($query2);
                return $WishListes2["id_wishlist"];
              }else{

                $wishlist = new WishList();
                $wishlist->id_shop = 1;
                $wishlist->id_shop_group = 1;
                $wishlist->counter = 1;
                $wishlist->name = 'WishListTest';
    
                $wishlist->id_customer = $id_customer ;
                list($us, $s) = explode(' ', microtime());
                srand($s * $us);
                $wishlist->token = strtoupper(substr(sha1(uniqid(rand(), true)._COOKIE_KEY_.$this->context->customer->id), 0, 16));
                $wishlist->add();
                $this->context->cookie->id_wishlist = (int)($wishlist->id);               
                $id_wishlist = (int)($wishlist->id);
                return $id_wishlist ; 
                
              }

        }


    }

    public function install()
    {
        Configuration::updateValue('WISHLISTMODULE_LIVE_MODE', false);

        include(dirname(__FILE__).'/sql/install.php');

        return parent::install() &&
            $this->registerHook('header') &&
            $this->registerHook('backOfficeHeader');
    }

    public function uninstall()
    {
        Configuration::deleteByName('WISHLISTMODULE_LIVE_MODE');

        include(dirname(__FILE__).'/sql/uninstall.php');

        return parent::uninstall();
    }

    /**
     * Load the configuration form
     */
    public function getContent()
    {
        /**
         * If values have been submitted in the form, process.
         */
        if (((bool)Tools::isSubmit('submitWishListModuleModule')) == true) {
            $this->postProcess();
        }

        $this->context->smarty->assign('module_dir', $this->_path);

        $output = $this->context->smarty->fetch($this->local_path.'views/templates/admin/configure.tpl');

        return $output.$this->renderForm();
    }

    /**
     * Create the form that will be displayed in the configuration of your module.
     */

    protected function renderForm()
    {
        $helper = new HelperForm();

        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->module = $this;
        $helper->default_form_language = $this->context->language->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG', 0);

        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submitWishListModuleModule';
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false)
            .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');

        $helper->tpl_vars = array(
            'fields_value' => $this->getConfigFormValues(), /* Add values for your inputs */
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id,
        );

        return $helper->generateForm(array($this->getConfigForm()));
    }

    /**
     * Create the structure of your form.
     */
    protected function getConfigForm()
    {
        return array(
            'form' => array(
                'legend' => array(
                'title' => $this->l('Settings'),
                'icon' => 'icon-cogs',
                ),
                'input' => array(
                    array(
                        'type' => 'switch',
                        'label' => $this->l('Live mode'),
                        'name' => 'WISHLISTMODULE_LIVE_MODE',
                        'is_bool' => true,
                        'desc' => $this->l('Use this module in live mode'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => true,
                                'label' => $this->l('Enabled')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => false,
                                'label' => $this->l('Disabled')
                            )
                        ),
                    ),
                    array(
                        'col' => 3,
                        'type' => 'text',
                        'prefix' => '<i class="icon icon-envelope"></i>',
                        'desc' => $this->l('Enter a valid email address'),
                        'name' => 'WISHLISTMODULE_ACCOUNT_EMAIL',
                        'label' => $this->l('Email'),
                    ),
                    array(
                        'type' => 'password',
                        'name' => 'WISHLISTMODULE_ACCOUNT_PASSWORD',
                        'label' => $this->l('Password'),
                    ),
                ),
                'submit' => array(
                    'title' => $this->l('Save'),
                ),
            ),
        );
    }
    /**
     * Set values for the inputs.
     */
    protected function getConfigFormValues()
    {
        return array(
            'WISHLISTMODULE_LIVE_MODE' => Configuration::get('WISHLISTMODULE_LIVE_MODE', true),
            'WISHLISTMODULE_ACCOUNT_EMAIL' => Configuration::get('WISHLISTMODULE_ACCOUNT_EMAIL', 'contact@prestashop.com'),
            'WISHLISTMODULE_ACCOUNT_PASSWORD' => Configuration::get('WISHLISTMODULE_ACCOUNT_PASSWORD', null),
        );
    }
    /**
     * Save form data.
     */
    protected function postProcess()
    {
        $form_values = $this->getConfigFormValues();

        foreach (array_keys($form_values) as $key) {
            Configuration::updateValue($key, Tools::getValue($key));
        }
    }
    /**
    * Add the CSS & JavaScript files you want to be loaded in the BO.
    */
    public function hookBackOfficeHeader()
    {
        if (Tools::getValue('module_name') == $this->name) {
            $this->context->controller->addJS($this->_path.'views/js/back.js');
            $this->context->controller->addCSS($this->_path.'views/css/back.css');
        }
    }
    /**
     * Add the CSS & JavaScript files you want to be added on the FO.
     */
    public function hookHeader()
    {
        $this->context->controller->addJS($this->_path.'/views/js/front.js');
        $this->context->controller->addCSS($this->_path.'/views/css/front.css');
    }
}
