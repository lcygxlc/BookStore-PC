export default {
    addCartItem(state, payload) {
        const cartItems = state.cartItems;
        let idx = cartItems.findIndex(items => {
            return items.goodsId === payload.goodsId
        });
        if (idx < 0) {
            cartItems.push(payload)
        } else {
            cartItems[idx].num += payload.num
        }
        sessionStorage.setItem('cartItems', JSON.stringify(cartItems))
    },
    addToBuyNow(state, payload) {
        state.buyNow.length = 0;
        state.buyNow.push(payload);
        sessionStorage.setItem('buyNow', JSON.stringify([payload]))
    },
    deleteCartItem(state, payload) {
        const cartItems = state.cartItems;
        let idx = cartItems.findIndex(items => {
            return items.goodsId === payload.goodsId
        });
        if (idx >= 0) {
            cartItems.splice(idx, 1)
            sessionStorage.setItem('cartItems', JSON.stringify(cartItems))
        }
    },
    clearCartItems(state) {
        state.cartItems.length = 0
        sessionStorage.removeItem('cartItems')
    },
    clearBuyNow(state) {
        state.buyNow.length = 0
        sessionStorage.removeItem('buyNow')
    },
    saveMyOrders(state, payload) {
        state.myOrders = payload;
    },
    updateOrderStatus(state, payload) {
        //console.log('update order status')
        //console.log(payload)
        for (let i = 0; i < state.myOrders.length; i++) {
            let order = state.myOrders[i]
            if (order.orderId === payload.orderId) {
                order.orderStatus = payload.status;
                state.myOrders.splice(i, 1, order)
                break;
            }
        }
    }

}