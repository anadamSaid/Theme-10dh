setTimeout(() => {
  document.getElementById("BtnDropToTop").addEventListener('click',function(){
    window.scroll({
    top: 0,
    behavior: 'smooth'
   });
   })
  window.onscroll = function() {
    var istransparent = document.getElementsByClassName('vvhomeslider-container').length;
    if(istransparent){
        if (window.scrollY > 35) {
          document.querySelector('.header-nav').classList.remove('header-nav-transparent');
        }
        else{
          document.querySelector('.header-nav').classList.add('header-nav-transparent');  	
          }
      } 
    if(document.getElementById("product-nav")){
      if(document.querySelector('.product-add-to-cart .add-to-cart').getBoundingClientRect().top>0){
        document.getElementById("product-nav").classList.remove("product-nav-open");
      }else{
        document.getElementById("product-nav").classList.add("product-nav-open");
      }
    }
    var scrollMaxY = window.scrollMaxY || (document.documentElement.scrollHeight - document.documentElement.clientHeight) ;
    var clientHeight = document.querySelector(".Ftr_Pricipale").clientHeight ;
    var limitOfFooter = scrollMaxY - clientHeight ;
    if(window.scrollY<550){
      document.querySelector(".ContainerbtnDropTop").style.display = "none" ;
    }else{
      document.querySelector(".ContainerbtnDropTop").style.display = "flex" ;
      if(window.scrollY<(limitOfFooter-20)){
        document.getElementById("BtnDropToTop").classList.add("BtnDropToTopshow");
      }else{
        document.getElementById("BtnDropToTop").classList.remove("BtnDropToTopshow") ;
      }
    }  
  };
}, 1000);