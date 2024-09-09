<template>
    <div class="container-fluid">
        <div class="row">
            <CateBar/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <OrderNav @status="changeStatus"></OrderNav>
        </div>
        <div class="col-md-10">
            <div v-if="showOrders.length == 0" class="alert alert-danger text-center" role="alert">
                对不起，暂无此类商品信息
            </div>
            <template v-else>
                <OrderItem v-for="order in showOrders" :key="order.orderId" :order="order"></OrderItem>
            </template>
        </div>
    </div>
</template>

<script>
import { mapGetters } from "vuex/dist/vuex.cjs.js";
import CateBar from "../components/CateBar.vue"
import OrderItem from "../components/OrderItem.vue";
import OrderNav from "../components/OrderNav.vue";

    export default {
        components:{
            CateBar,
            OrderNav,
            OrderItem
        },
        data(){
            return{
                showOrders:[]
            }
        },
        methods:{
            changeStatus(status){
                if(status == 'all'){
                    this.showOrders = this.myOrders
                }else{
                    this.showOrder = this.myOrders.filter((item)=>{
                        return item.orderStatus == status
                    })
                }
            },
        },
        computed:{
            ...mapGetters({
                myOrders:'order/myOrders'
            })
        },
        watch:{
            myOrders(orders){
                this.showOrders = orders
            }
        },
        created(){
            this.$store.dispatch('order/fetchMyOrders')
        }
        
    }
</script>

<style lang="scss" scoped>

</style>