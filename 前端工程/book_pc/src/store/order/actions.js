import { populateFormData, populateArrayFormData } from "../../utils/util";
import { axios } from "../../utils/axios"
export default {
    addToCart({ commit }, payload) {
        commit('addCartItem', payload)
    },
    addToBuyNow({ commit }, payload) {
        const params = populateFormData(payload.cartItem);
        axios.post("/order/buyGoods", params).then(
            (res) => {
                if (res.data.code == 0) {
                    commit('addToBuyNow', payload.cartItem);
                    payload.success()
                } else {
                    payload.fail()
                }
            }
        )
    },
    deleteCartItem({ commit }, item) {
        commit('deleteCartItem', item);
    },
    clearCartItems({ commit }) {
        commit('clearCartItems')
    },
    toCheckout(context, payload) {
        
        const params = populateArrayFormData(context.state.cartItems);
        axios.post("/order/buyGoods", params).then(
            (res) => {
                console.log(res.data.code);
                if (res.data.code == 0) {
                    payload.success()
                } else {
                    payload.fail()
                }
            },
        )
    },
    checkout({ commit }, payload) {
        const params = populateFormData(payload.data);
        axios.post("/order/addOrder", params).then(
            (res) => {
                if (res.data.code == 0) {
                    if (payload.type === 'cart') {
                        commit('clearCartItems');
                    } else if (payload.type == 'now') {
                        commit('clearBuyNow')
                    }
                    payload.success(res.data.orderId)
                } else {
                    payload.fail()
                }
            },
        )
    },
    fetchMyOrders({ commit }) {
        axios.get("/order/getMyOrders").then(
            (res) => {
                if (res.data.code == 0) {
                    commit('saveMyOrders', res.data.orders);
                }
            },
        )
    }
}