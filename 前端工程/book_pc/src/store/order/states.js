let buyNow=sessionStorage.getItem('buyNow');
if(buyNow){
    buyNow=JSON.parse(buyNow);
}else{
    buyNow=[]
}
let cartItems=sessionStorage.getItem('cartItems');
if(cartItems){
    cartItems=JSON.parse(cartItems);
}else{
    cartItems=[]
}
export default {
    cartItems:cartItems,
    buyNow:buyNow,
    myOrders:[]
}