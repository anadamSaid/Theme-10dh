
{extends file='page.tpl'}


{block name='page_title'}
    {l s='Wish List' d='Shop.Theme.Shop'} 
{/block}

{block name='page_content'}
    <div id="Prd_wishList">
        <div class="No_Product_Exist" >
          <p>{l s='Your wishlist is currently empty' d='Shop.Theme.Shop'} </p>
          <a href="/2-home" class="btn">{l s='Continue browsing' d='Shop.Theme.Shop'} </a>
        </div>
            <div class="MessageCnct">
            <div class="alert alert-warning alert-dismissible show">
            <div class="wrn">
                <svg width="22" height="21" viewBox="0 0 22 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M10.0037 13.1337H12.0037V7.13373H10.0037V13.1337ZM11.0037 14.6337C10.3133 14.6337 9.75366 15.1934 9.75366 15.8837C9.75366 16.5741 10.3133 17.1337 11.0037 17.1337C11.694 17.1337 12.2537 16.5741 12.2537 15.8837C12.2537 15.1934 11.694 14.6337 11.0037 14.6337V14.6337Z" fill="black"/>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M0.115234 19.418L10.1152 0.41803H11.8851L21.8851 19.418L21.0002 20.8837H1.00023L0.115234 19.418V19.418ZM2.65653 18.8837H19.3438L11.0002 3.03083L2.65653 18.8837V18.8837Z" fill="black"/>
                </svg>
            </div>
            <div class="msj">
            <h3>{l s='These lists are only temporary' d='Shop.Theme.Shop'} </h3> 
            <span><a href="{_PS_BASE_URL_}{__PS_BASE_URI__}login">Log in or sign up</a> to make sure your lists are available when you return and to view them on other devices.</span>
            </div>
            </div>
            </div>
        <div class="schairwishList">
            <div class="shaireBellowProduct">
            {if $page.page_name =='product' || $page.page_name =='module-WishListModule-fcont' }
            {hook h='displaysharebuttons' }
            {/if}
            </div>
        </div>
        </div>      
    </div>
    <script type='text/javascript' src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

    <script>
        var stored = localStorage['WishListId'];
        var arry = JSON.parse(stored) ;
        if(arry.length != 0)
        {
            var stored = localStorage['WishListId'];
            var link = "?idListProducts=" + JSON.parse(stored) ;
            document.querySelector(".schairwishList .social-sharing .facebook a").href += link ;
            document.querySelector(".schairwishList .social-sharing .twitter a").href += link ;
            document.querySelector(".schairwishList .social-sharing .pinterest a").href += link ;
            document.querySelector(".schairwishList .social-sharing .whatsapp a").href += link ;
            document.querySelector(".schairwishList .social-sharing .gmail a").href += link + "%0D%0DUnisex%20Tank%20Top%20-%20White%20w/%20Purple%20Debutterfly%20%E2%80%94%20Ready%20to%20hit%20the%20court?%20Show%20those%20other%20players%20what%20a%20winner%20is%20made%20of?%20Hold%20it%20right%20there!%20If...%0D";
        }
    </script>


    {if $customer.is_logged}
    <script>
        var stored = localStorage['WishListId'];
        var arry = JSON.parse(stored) ;
        if(arry.length != 0){
            let costumerId = {$customer.id} ;
            let wishListId = 2 ;
            var stored = localStorage['WishListId'];
            var arry = JSON.parse(stored) ;
            var url1 = '{__PS_BASE_URI__}modules/WishListModule/testajax.php?wishlistIds='+arry;
            $.ajax({
                url: url1,
                success: function(data) {
                    var ProductsIds = [] ;
                    var ProductsQuantity = [] ;
                    var ProductsIdattribute = [] ;
                    for (let index = 0; index < data.length; index++) {
                            const element = data[index];
                            ProductsIds.push(element.id);
                            ProductsQuantity.push(element.quantity_discount);
                            ProductsIdattribute.push(element.cache_default_attribute);                                   
                    } 
                    var url2 = '{__PS_BASE_URI__}modules/WishListModule/addtowishlist.php?idcostumer='+costumerId+'&productIds='+ProductsIds+'&productsquantity=0&wishListId=2'+'&productsattributs='+ProductsIdattribute;
                    $.ajax({
                        url: url2,
                        success: function(data)
                        {
                        
                        }
                    });                                          
                },
            });
        }            
    </script>
    {/if}
     
    {if $idListProducts}
        <script>
            var arry = [{$idListProducts}] ;
            var Price ;
            var TitelProduct ;
            
            if(arry.length != 0){
                document.querySelector('#Prd_wishList .No_Product_Exist').style.display = "none" ;
                document.querySelector('.MessageCnct').style.display = "block" ;
                var url = '{__PS_BASE_URI__}modules/WishListModule/testajax.php?wishlistIds='+arry;
                $.ajax({
                url: url,
                success: function(data) {   
                        {if $customer.is_logged}
                                window.location.replace("{$link->getModuleLink('blockwishlist', 'lists')}");
                        {/if}                                       
                    for (let index = 0; index < data.length; index++) {
                                const element = data[index]; 
                                Price = parseFloat(element.price).toFixed(2);
                                document.getElementById("Prd_wishList").innerHTML += "<div class='Product_wishList' id='Productnb"+element.id+"'><div class='Product_Wl_Image' ><img class='Product_Wl_img' src='http://"+element.image+"'></div><div class='Product_Wl_Information'><div class='Product_Wl_Titel_Rmv col-lg-4 col-sm-4'><div class='Product_Wl_Titel'><h5><a href='' class='cart__product-name'>"+element.name["1"]+"</a></h5></div><div class='Product_Wl_Remove'><p><button type='button'  data-has-click-event='true' onclick='DeleteFromWishList("+element.id+")'><span class='material-icons-outlined'>delete</span><span class='small--hide'>Remove</span></button></p></div></div><div class='Product_Wl_Price col-lg-4 col-sm-4 '><span class='money'>"+"$"+Price+"</span></div><div class='Product_Wl_AddToCart col-lg-4 col-sm-4 '><div class='container_btn_AddToCart' onclick=AddToCart("+element.id+","+element.minimal_quantity+")><button type='button'>Add to Cart</button></div></div></div></div></div>"; 
                    }
                },
                error: function(xhr, string, error) {
                }
                });
            }else{
                document.querySelector('.schairwishList .shaireBellowProduct').style.display = "none" ;
            }
           
        </script>
    {else}    
        <script>
        var stored = localStorage['WishListId'];
        var arry = JSON.parse(stored) ;
        if(arry.length != 0){
            document.querySelector('#Prd_wishList .No_Product_Exist').style.display = "none" ;
            document.querySelector('.MessageCnct').style.display = "block" ;
            var url = '{__PS_BASE_URI__}modules/WishListModule/testajax.php?wishlistIds='+arry;
            $.ajax({
                    url: url,
                    success: function(data) {     
                        {if $customer.is_logged}
                                window.location.replace("{$link->getModuleLink('blockwishlist', 'lists')}");
                        {/if}               
                        for (let index = 0; index < data.length; index++) {
                                    const element = data[index]; 
                                    Price = parseFloat(element.price).toFixed(2);
                                    document.getElementById("Prd_wishList").innerHTML += "<div class='Product_wishList' id='Productnb"+element.id+"'><div class='Product_Wl_Image' ><img class='Product_Wl_img' src='http://"+element.image+"'></div><div class='Product_Wl_Information'><div class='Product_Wl_Titel_Rmv col-lg-4 col-sm-4'><div class='Product_Wl_Titel'><h5><a href='"+element.url+"' class='cart__product-name'>"+element.name["1"]+"</a></h5></div><div class='Product_Wl_Remove'><p><button type='button'  data-has-click-event='true' onclick='DeleteFromWishList("+element.id+")'><span class='material-icons-outlined'>delete</span><span class='small--hide'>Remove</span></button></p></div></div><div class='Product_Wl_Price col-lg-4 col-sm-4 '><span class='money'>"+"$"+Price+"</span></div><div class='Product_Wl_AddToCart col-lg-4 col-sm-4 '><div class='container_btn_AddToCart' onclick=AddToCart("+element.id+","+element.minimal_quantity+")><form action='{$urls.pages.cart}' method='post' id='add-to-cart-or-refresh'><input type='hidden' name='token' value='{$static_token}'><input type='hidden' name='id_product' value="+element.id+" id='product_page_product_id'><input type='hidden' name='qty' inputmode='numeric' pattern='[0-9]*'  value='"+element.minimal_quantity+"' min='"+element.minimal_quantity+"'><button  data-button-action='add-to-cart' type='submit'>Add to Cart</button></form></div></div></div></div></div>"; 
                                } 
                    },
                    error: function(xhr, string, error) {
                        if (xhr.status > 400) {
                        } 
                    }
            });
        }else{
            document.querySelector('.schairwishList .shaireBellowProduct').style.display = "none" ;     
        }     
        </script>
    {/if}
				<script>
				function DeleteFromWishList(x){     
						var wishList_Products = JSON.parse(localStorage.getItem("WishListId") || "[]");
						var index = wishList_Products.indexOf(x);
						let query = "Productnb"+x  ;
						const elm = document.getElementById(query);
						elm.remove();
						wishList_Products.splice(index, 1);
						localStorage.setItem("WishListId", JSON.stringify(wishList_Products));

						var stored = localStorage['WishListId'];
						var arry = JSON.parse(stored) ;
						if(arry.length == 0)
						{
								document.querySelector('.schairwishList .shaireBellowProduct').style.display = "none" ;
								document.querySelector('#Prd_wishList .No_Product_Exist').style.display = "flex" ;
								document.querySelector('.MessageCnct').style.display = "none" ;
						}

				}
				function AddToCart(Idproduct,Qts) 
				{
						const token = prestashop.static_token;
						const url = prestashop.urls.pages.cart;
						const query = 'controller=cart&add=1&action=add&ajax=true&token=' + token + '&id_product=' + Idproduct + '&id_customization=0&qty=' + Qts;
						var controllerUrl = url.concat(query);
						var functionName = "addToCart";

						
						$.ajax({
								cache: false,
								data: query,
								success: function(resp) 
										{
												prestashop.emit('updateCart', {
														reason: {}, resp: resp
												});                   
										},
										error: function(resp) {
										
										}
						});
				}    
				</script>
<style>

#Prd_wishList{
    height: 100%;
    width: 100%;
}
.Product_wishList{
    height: 100%;
    width: 100%;
    display: flex;
    background-color: var(--accent-background);
    border-radius: 6px;
    margin-bottom: 18px;
}
.Product_Wl_Image{
    margin: 14px;
    overflow: hidden;
    width: 250px;
    border-radius: 6px;
}
.Product_Wl_img{
    border-radius: 6px;
    object-fit: fill;
    width: 100%;
    height: 100%;
}
.Product_Wl_img:hover{
    transform: scale(1.2);
    transition: ease transform .5s;
    opacity: 0.6;
}
}
.Product_Wl_img:hover{
    cursor: pointer;
    opacity: 0.6
    ;
}
.Product_Wl_Information{
    display: flex;
    flex-direction: row;
    width: 100%;
    padding: 20px 0px;
}
.Product_Wl_Titel_Rmv{
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.Product_Wl_Price{
    display: flex;
    align-items: center;
}
.Product_Wl_Price span{
    font-weight: 700;
    color: var(--page-sales-price);
    font-family: var(--font-accent-family);
    letter-spacing: var(--font-accent-letter-spacing);
    text-transform: var(--font-accent-transform);
    margin-top: 16px;
    text-align: center;
}
.Product_Wl_AddToCart{
    display: flex;
    align-items: center;
    justify-content: flex-end;
}
.Product_Wl_Titel h5 a{
    font-size: var(--base-font-size);
    font-weight: 600;
    color: var(--page-headings);
    text-align: center;
    text-decoration: none;
    letter-spacing: var(--font-headings-letter-spacing);
    font-family: var(--font-headings-family);
    text-transform: var(--font-headings-transform);
}
.Product_Wl_Titel h5 a:hover ,.Product_Wl_Remove button :hover{
    opacity: 0.6;
}
.Product_Wl_Remove p button{
    cursor: pointer;
    background: none;
    border: none;
    padding-left: 0px;
    display: flex;
    align-items: center;
}
.Product_Wl_Remove p button span{
    font-size: 16px;
    color: var(--gray-dark-2);
}
.Product_Wl_AddToCart button{   
    font-family: var(--font-accent-family);
    letter-spacing: var(--font-accent-letter-spacing);
    text-transform: var(--font-accent-transform);
    width: 100%;
    border: 1px solid var(--page-buttons);
    background-color: transparent;
    color: var(--page-buttons);
    margin-top: 0!important;
    padding: 0.5rem 1.25rem;
    font-weight: 600;
    transition: all .2s ease;
}
.Product_Wl_AddToCart button:hover{   
    box-shadow: 0 0 0 0.2rem var(--page-hover);
    color: var(--white);
    background-color: var(--page-buttons);
    outline: 0;
}
.Product_Wl_AddToCart .container_btn_AddToCart {
    width: 100%;
    
}
.Product_Wl_AddToCart .container_btn_AddToCart :hover{
    cursor: pointer;
}
.Product_Wl_AddToCart .container_btn_AddToCart button:focus{
    outline : none ;
}
.schairwishList .social-sharing{
    display: flex;
    justify-content: flex-end;
    margin-bottom: 0px;
}

#Prd_wishList .No_Product_Exist{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
} 

#Prd_wishList .No_Product_Exist p{
    font-size: 16px;
    color: #444;
}

#Prd_wishList .No_Product_Exist a{
    box-shadow: 0 0 0 0.2rem var(--page-hover);
    color: var(--white);
    background-color: var(--page-buttons);
    color: #fff;
    border-radius: 6px;
    padding: 16px 24px;
    font-weight: 600;
}

#Prd_wishList .No_Product_Exist a:hover{
    box-shadow: 0 0 0 0.2rem var(--page-hover);
    color: var(--white);
    background-color: var(--page-buttons);
}

.MessageCnct .alert-warning{
    background: transparent;
    border-radius: 6px;
    border-width: 2px;
    display: flex;
}

.MessageCnct .alert-warning h3{
    font-weight: 600;
    font-size: 15px;
}

.MessageCnct span a{
    display: inline;

}

.MessageCnct{
    display: none;
}

.MessageCnct .wrn{
    display: flex;
    justify-content: center;
    align-items: center;
    padding-right: 10px;
}

.MessageCnct .wrn svg{
    width: 65px;
    height: 57%; 
}
.MessageCnct .wrn svg path{
    fill: #ffa524;
}
.MessageCnct .msj{
    display: flex;
    justify-content: center;
    flex-direction: column;
}

#Prd_wishList .shaireBellowProduct{
    margin: 0px;
}
  






@media (max-width: 1200px) {
    #module-WishListModule-fcont #wrapper .container{
        width: 100%;
    }

    #module-WishListModule-fcont #PagesTheme{
        padding: 0px;
    }
}
@media (max-width: 760px) {
    .Product_wishList .Product_Wl_Information{
        flex-direction: column;
    }

    .Product_wishList .Product_Wl_Information .Product_Wl_Titel_Rmv , .Product_wishList .Product_Wl_Information .Product_Wl_Price , .Product_wishList .Product_Wl_Information .Product_Wl_AddToCart{
        width: 100%;
    }

    .Product_wishList .Product_Wl_Information .Product_Wl_Titel_Rmv{
        flex-direction: row;
        justify-content: space-between;
    }

    .Product_wishList .Product_Wl_Information .Product_Wl_Titel_Rmv .Product_Wl_Remove .small--hide{
         display: none;
    }

    .Product_Wl_Price  .money{
        padding-left: 0px;
    }

    .Product_Wl_AddToCart{
        margin-top: 15px;
    }
    .Product_Wl_AddToCart .container_btn_AddToCart{
        padding-left: 0px;
    }
    .Product_Wl_img {
        border-radius: 6px;
        object-fit: fill;
        width: 100%;
        height: 100%;
    }
    .Product_Wl_Image {
        height: 63%;

    }
     
}
</style>
{/block}