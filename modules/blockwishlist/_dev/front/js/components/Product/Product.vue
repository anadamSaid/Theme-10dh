<!--**
 * 2007-2020 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *-->
<template>
  <div class="wishlist-product">
    <div
      class="wishlist-product-link row"
      
    >
      <div class="wishlist-product-image col-lg-3">
        <img
          v-if="product.default_image"
          :src="product.default_image.large.url"
          :alt="product.default_image.legend"
          :title="product.default_image.legend"
          :class="{
            'wishlist-product-unavailable': !product.add_to_cart_url
          }"
        >
        <img
          v-else-if="product.cover"
          :src="product.cover.large.url"
          :alt="product.cover.legend"
          :title="product.cover.legend"
          :class="{
            'wishlist-product-unavailable': !product.add_to_cart_url
          }"
        >
        <img
          v-else
          :src="prestashop.urls.no_picture_image.bySize.home_default.url"
        >

        <p
          class="wishlist-product-availability"
          v-if="product.show_availability"
        >
          <i
            class="material-icons"
            v-if="product.availability === 'unavailable'"
          >
            block
          </i>
          <i
            class="material-icons"
            v-if="product.availability === 'last_remaining_items'"
          >
            warning
          </i>
          {{ product.availability_message }}
        </p>
      </div>

      <div class="wishlist-product-Information col-lg-9 col-xs-6" >
  
      <div class="wishlist-product-right col-lg-4">
        <a class="wishlist-product-title" :href="product.canonical_url">{{ product.name }}</a>
          <button
          class="wishlist-button-add"
          v-if="!isShare"
          @click="removeFromWishlist"
        >
          <i class="material-icons">delete</i>
          <span d-lg-none >Remove</span>
        </button>
        <!-- <div class="wishlist-product-combinations">
          <p class="wishlist-product-combinations-text">
            <template v-for="(attribute, key, index) of product.attributes">
              {{ attribute.group }} : {{ attribute.name }}
              <span
                :key="key"
                v-if="index <= Object.keys(product.attributes).length - 1"
              >
                -
              </span>

              <span
                :key="key + 'end'"
                v-if="index == Object.keys(product.attributes).length - 1"
              >
                {{ quantityText }} : {{ product.wishlist_quantity }}
              </span>
            </template>

            <span v-if="Object.keys(product.attributes).length === 0">
              {{ quantityText }} : {{ product.wishlist_quantity }}
            </span>
          </p>

          <a
            :href="product.canonical_url"
            v-if="!isShare"
          >
            <i class="material-icons">create</i>
          </a>
        </div> -->
      </div>
      <div class="Container_ws-productPrice col-lg-4" >
        <p class="wishlist-product-price">
          <span
            class="wishlist-product-price-promo"
            v-if="product.has_discount"
          >
            {{ product.regular_price }}
          </span>
          {{ product.price }}
        </p>
      </div>
      <div class="wishlist-product-bottom col-lg-4">
      <button
        class="btn wishlist-product-addtocart"
        :class="{
          'btn-secondary': product.customizable === '1',
          'btn-outline-primary': product.customizable === '0'
        }"
        :disabled="isDisabled || forceDisable"
        @click="
          product.add_to_cart_url || product.customizable === '1'
            ? addToCartAction()
            : null
        "
        >
        {{ product.customizable === '1' ? customizeText : addToCart }}
      </button>   
    </div>
  </div>



</div>

    

    <p
      class="wishlist-product-availability wishlist-product-availability-responsive"
      v-if="product.show_availability"
    >
      <i
        class="material-icons"
        v-if="product.availability === 'unavailable'"
      >
        block
      </i>
      <i
        class="material-icons"
        v-if="product.availability === 'last_remaining_items'"
      >
        warning
      </i>
      {{ product.availability_message }}
    </p>

  </div>
</template>

<script>
  import EventBus from '@components/EventBus';
  import headers from '@constants/headers';
  import prestashop from 'prestashop';
  import wishlistAddProductToCartUrl from 'wishlistAddProductToCartUrl';

  export default {
    name: 'Product',
    props: {
      product: {
        type: Object,
        required: true,
        default: null,
      },
      listId: {
        type: Number,
        required: true,
        default: null,
      },
      listName: {
        type: String,
        required: true,
        default: '',
      },
      isShare: {
        type: Boolean,
        required: false,
        default: false,
      },
      customizeText: {
        type: String,
        required: true,
        default: 'Customize',
      },
      quantityText: {
        type: String,
        required: true,
        default: 'Quantity',
      },
      addToCart: {
        type: String,
        required: true,
      },
      status: {
        type: Number,
        required: false,
        default: 0,
      },
      hasControls: {
        type: Boolean,
        required: false,
        default: true,
      },
    },
    data() {
      return {
        prestashop,
        forceDisable: false,
      };
    },
    computed: {
      isDisabled() {
        const wishlistQuantity = parseInt(this.product.wishlist_quantity, 10);
        const quantityAvailable = parseInt(this.product.quantity_available, 10);
        const cartQuantity = parseInt(this.product.cart_quantity, 10);

        if (this.product.allow_oosp) {
          return false;
        }

        if (this.product.customizable === '1') {
          return false;
        }

        if (wishlistQuantity > quantityAvailable) {
          return true;
        }

        if (cartQuantity >= quantityAvailable) {
          return true;
        }

        if (cartQuantity
          && cartQuantity + wishlistQuantity > quantityAvailable
        ) {
          return true;
        }

        return !this.product.add_to_cart_url;
      },
    },
    methods: {
      /**
       * Remove the product from the wishlist
       */
      async removeFromWishlist() {
        EventBus.$emit('showDeleteWishlist', {
          detail: {
            listId: this.listId,
            listName: this.listName,
            productId: this.product.id,
            productAttributeId: this.product.id_product_attribute,
          },
        });
      },
      async addToCartAction() {
        if (this.product.add_to_cart_url && this.product.customizable !== '1') {
          try {

            this.forceDisable = true;
            const datas = new FormData();
            datas.append('qty',this.product.wishlist_quantity);
            datas.append('id_product',this.product.id_product);
            datas.append('id_customization',this.product.id_customization);

            const response = await fetch(
              `${this.product.add_to_cart_url}&action=update`,
              {
                method: 'POST',
                headers: headers.addToCart,
                body: datas,
              },
            );

            const resp = await response.json();

            EventBus.$emit('refetchList');

            prestashop.emit('updateCart', {
              reason: {
                idProduct: this.product.id_product,
                idProductAttribute: this.product.id_product_attribute,
                idCustomization: this.product.id_customization,
                linkAction: 'add-to-cart',
              },
              resp,
            });

            $('body').on('hide.bs.modal', '#blockcart-modal', () => {
              this.forceDisable = false;
            });

            /* eslint-disable */
            const statResponse = await fetch(
              `${wishlistAddProductToCartUrl}&params[idWishlist]=${this.listId}&params[id_product]=${this.product.id_product}&params[id_product_attribute]=${this.product.id_product_attribute}&params[quantity]=${this.product.wishlist_quantity}`,
              {
                headers: {
                  'Content-Type':
                    'application/x-www-form-urlencoded; charset=UTF-8',
                  Accept: 'application/json, text/javascript, */*; q=0.01'
                }
              }
            );
            /* eslint-enable */

            await statResponse.json();
          } catch (error) {
            prestashop.emit('handleError', {
              eventType: 'addProductToCart',
              resp: error,
            });
          }
        } else {
          window.location.href = this.product.canonical_url;
        }
      },
    },
  };
</script>

<style lang="scss" type="text/scss">
  @import '@scss/_variables';

  .wishlist {
    &-products-item {
      margin: 1.5625rem;
    }

    &-product {
      max-width: 15.625rem;
      width: 100%;
      position: relative;
      height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: space-between;

      &-unavailable {
        opacity: 0.5;
      }

      &-availability {
        display: flex;
        align-items: flex-start;
        margin-bottom: 0;
        color: #232323;
        font-size: 0.75rem;
        font-weight: bold;
        letter-spacing: 0;
        line-height: 1.0625rem;
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        bottom: 1.0625rem;
        z-index: 5;
        min-width: 80%;
        justify-content: center;

        i {
          color: #ff4c4c;
          margin-right: 0.3125rem;
          font-size: 1.125rem;
        }

        &-responsive {
          display: none;
          position: inherit;
          transform: inherit;
          bottom: inherit;
          margin-top: 0.625rem;
          left: inherit;
        }
      }

      &-link {
        &:focus {
          text-decoration: none;
        }

        &:hover {
          img {
            transform: translate(-50%, -50%) scale(1.1);
          }
        }
      }

      &-title {
        margin-top: 0.625rem;
        margin-bottom: 0.315rem;
        color: #737373;
        font-size: 0.875rem;
        letter-spacing: 0;
        line-height: 1.875rem;
      }

      &-image {
        width: 15.625rem;
        height: 15.625rem;
        position: relative;
        overflow: hidden;

        img {
          position: absolute;
          max-width: 100%;
          max-height: 100%;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          transition: 0.25s ease-out;
        }
      }

      &-price {
        color: #232323;
        font-size: 1rem;
        font-weight: bold;
        letter-spacing: 0;
        line-height: 1.375rem;

        &-promo {
          text-decoration: line-through;
          color: #737373;
          font-size: 0.875rem;
          font-weight: bold;
          letter-spacing: 0;
          line-height: 1.1875rem;
          margin-right: 0.3125rem;
          vertical-align: middle;
          display: inline-block;
          margin-top: -0.1875rem;
        }
      }

      &-combinations {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;

        a {
          display: block;
          color: #7a7a7a;

          &:hover {
            color: $blue;
          }
        }

        &-text {
          color: #7a7a7a;
          font-size: 0.8125rem;
          letter-spacing: 0;
          line-height: 1.25rem;
          min-height: 3.125rem;
          margin: 0;
        }
      }

      &-addtocart {
        width: 100%;
        text-transform: inherit;
        padding-left: 0.625rem;

        &.btn-secondary {
          background-color: #dddddd;

          &:hover {
            background-color: #dddddd;
            opacity: 0.7;
          }
        }

        i {
          margin-top: -0.1875rem;
        }
      }
    }

    &-button {
      &-add {
        position: absolute;
        top: 0.625rem;
        right: 0.625rem;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 2.5rem;
        width: 2.5rem;
        min-width: 2.5rem;
        padding-top: 0.1875rem;
        background-color: #ffffff;
        box-shadow: 0.125rem 0.125rem 0.25rem 0 rgba(0, 0, 0, 0.2);
        border-radius: 50%;
        cursor: pointer;
        transition: 0.2s ease-out;
        border: none;

        &:hover {
          opacity: 0.7;
        }

        &:focus {
          outline: 0;
        }

        &:active {
          transform: scale(1.2);
        }

        i {
          color: #7a7a7a;
          margin-top: -0.125rem;
        }
      }
    }
  }

  .wishlist-products-container{
    #content{
      box-shadow: none;
      .wishlist-products-container .wishlist-products-list{
        padding: 0px 15px !important;
      }
    }
  }

  .wishlist-product{
        max-width: 100%;
        display: block;
        border-radius: 6px;
        background: var(--accent-background);
        
        .wishlist-product-image{
          padding: 0px;
          border-radius: 6px;
          margin: 15px;
          margin-left: 30px;
          width: 220px;
          height: 220px;
          img{
            padding: 0px;
            border-radius: 6px;
            height: 100%;
            width: 100%;
          }
          img:hover{
            opacity: 0.6;

          }
        }  
        .wishlist-product-Information{
          display: flex;
          .wishlist-product-right{
            display: flex;
            flex-direction: column;
            justify-content: center;
            .wishlist-button-add{
            position: initial;
            width: 100%;
            padding: 0px 0px;
            background: transparent;
            justify-content: flex-start;
            box-shadow: none;
          }
          .wishlist-product-title{
            font-size: 17px;
            font-weight: 600;
            color: var(--page-headings);
            padding-left: 5px;
          }
          .wishlist-product-title:hover{
            cursor: pointer;
            opacity: 0.6;
          }
        }
        .Container_ws-productPrice{
                display: flex;
                align-items: center;
                .wishlist-product-price{
                  color: var( --gray-dark-2);
                }
                .wishlist-product-price:hover{
                  cursor: auto;
                }
        }
        .wishlist-product-bottom{
                display: flex;
                align-items: center;
                wishlist-product-addtocart{
                  font-weight: 600;
                }
                wishlist-product-addtocart:hover{
                  cursor: pointer;
                }
        }

        }    
  }

  .wishlist-product-link{
        display: flex;
  }

  .wishlist-product-link:hover{
        cursor: context-menu;
        .wishlist-product-image{ 
          img:hover{
            cursor: pointer;
          }
        }
    }

  @media screen and (max-width: 770px) {
    .wishlist {
      &-button-add {
        position: inherit;
        margin-left: 0.625rem;
      }

      &-products-item {
        width: 100%;
        margin: 0;
        margin-bottom: 1.875rem;

        &:not(:last-child) {
          margin-bottom: 1.875rem;
        }
      }

      &-product {
        margin: 0;
        width: 100%;
        max-width: 100%;

        &-link {
          &:hover {
            img {
              transform: inherit;
            }
          }
        }

        &-bottom {
          display: flex;
          align-items: center;
          justify-content: space-between;
        }

        &-right {
          flex: 1;
        }

        &-availability {
          display: none;

          &-responsive {
            display: block;
            min-width: 100%;
            justify-content: flex-start;
          }
        }

        &-image {
          width: 100px;
          height: 100px;
          margin-right: 1.25rem;
          position: inherit;

          img {
            position: inherit;
            left: inherit;
            top: inherit;
            transform: inherit;
          }
        }

        &-link {
          display: flex;
          align-items: flex-start;
        }

        &-title {
          margin-top: 0;
        }
      }
    }
    .wishlist-product{
      

      .wishlist-product-link{
        align-items: flex-start;
        .wishlist-product-Information{
        flex-direction: column;
        padding: 15px 0px;

        .wishlist-product-right{
          padding: 0px 0px;
          padding: 0px 0px;
          display: flex;
          flex-direction: row;
          justify-content: space-between;
          .wishlist-button-add{
            margin-left: 0px;
            width: 25px;
            display: flex;
            justify-content: flex-end;
            span{
              display: none;
            }

          }
          .wishlist-button-add :hover{
             cursor: pointer;
             opacity: 0.6;
          }
        }
        .Container_ws-productPrice{
          padding: 0px 4px;
        }
        .wishlist-product-bottom{
          padding: 0px 0px;
        }
        }
        .wishlist-product-image{
          margin-right: 0px;
          width: 35%;
          height: 100%;
          margin-right: 15px
        }
      }
    }

    .wishlist-product-link{
      background: #faf8ff;
      border-radius: 6px;
    }
  }
</style>
