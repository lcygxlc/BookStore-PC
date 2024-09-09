<template>
    <cate-bar />
    <CheckOut :type="type" :addresses="addresses" :cartItems="cartItems" />
</template>
  <script>
import { mapGetters } from 'vuex'
import CateBar from '../components/CateBar.vue'
import CheckOut from '../components/Checkout.vue'
export default {
    data() {
        return {
            cartItems: []
        }
    },
    computed: {
        ...mapGetters({
            addresses: 'user/addresses'
        })
    },
    components: {
        CateBar,
        CheckOut
    },
    created() {
        if (this.addresses.length == 0) {
            this.$store.dispatch('user/fetchUserAddress')
        }
        this.type = this.$route.params.type
        if (this.type == 'now') {
            this.cartItems = this.$store.getters['order/buyNow']
        } else {
            this.cartItems = this.$store.getters['order/cartItems']
        }
    }
}
</script>