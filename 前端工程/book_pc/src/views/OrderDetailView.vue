<!-- eslint-disable no-const-assign -->
<template>
    <CateBar></CateBar>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <h3>订单信息</h3>
            <table class="table table-condensed table-hover">
                <tbody>
                    <tr>
                        <td>订单号：{{ orderDetail.orderCode }}</td>
                        <td>创建时间：{{ orderDate }}</td>
                    </tr>
                    <tr>
                        <td>订单状态：<span id="orderStatus">
                            {{ orderStatus }}
                        </span></td>
                        <td>收货地址：{{ orderDetail.orderAddress }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-info">
                <div class="panel-heading">商品列表</div>
                <div class="panel-body">
                    <table class="table table-condensed table-hover">
                        <thead>
                            <tr>
                                <th>序号</th>
                                <th>商品图片</th>
                                <th>商品名称</th>
                                <th>商品单价</th>
                                <th>数量</th>
                                <th>小计</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item,index) in orderDetail.odetails" :key="item.odetailId">
                                <td>{{ index + 1 }}</td>
                                <td>
                                    <img :src="prefix(item.odetailPic)" alt="暂无图片" width="30" height="30">
                                </td>
                                <td>{{ item.odetailName }}</td>
                                <td>单价 <span class="glyphicon glyphicon-yen" aria-hidden="true">{{ item.odetailPrice }}</span></td>
                                <td>{{ item.odetailNum }}</td>
                                <td><span class="glyphicon glyphicon-yen" aria-hidden="true">{{ item.odetailPrice * item.odetailNum }}</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <table class="table table-condensed table-hover">
                <tbody>
                    <tr class="text-right">
                        <td>
                            运费：<span class="glyphicon glyphicon-yen" aria-hidden="true">{{ orderDetail.orderPostalfee }}</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right">订单总金额（含运费）<span class="glyphicon glyphicon-yen" aria-hidden="true">{{ totalFee }}</span></td>
                    </tr>
                </tbody>
            </table>
            <form action="" ref="form">
                <input type="hidden" name="oid" :value="orderDetail.orderId">
                <input type="hidden" name="oname" :value="orderDetail.orderCode">
                <input type="hidden" name="money" :value="totalFee">
                <input type="hidden" name="desc" value="">
            </form>
            <div class="col-md-12 text-right">
                <button class="btn btn-primary" type="button" v-if="orderDetail.orderStatus == 0" @click="pay">
                    支付
                </button>
            </div>
        </div>
    </div>
</template>

<script>
import CateBar from '../components/CateBar.vue'
export default {
    components:{
        CateBar
    },
    data(){
        return {
            orderDetail:{}
        }
    },
    computed:{
        orderStatus(){
            let status = ""
            switch (this.orderDetail.orderStatus) {
                case 0:
                    status = "等待付款"
                    break;
                case 1:
                    status = "未发货"
                    break;
                case 2:
                    status = "退款申请，等待处理"
                    break;
                case 3:
                    status = "退款成功"
                    break;
                case 4:
                    status = "已发货"
                    break;
                case 5:
                    status = "交易成功"
                    break;
                case 6:
                    status = "退货申请，等待申请"
                    break;
                case 7:
                    status = "退货中"
                    break;
                case 8:
                    status = "退货成功"
                    break;
                case 9:
                    status = "交易关闭"
                    break;
            }return status;
        },
        orderDate(){
            if(this.orderDetail && this.orderDetail.orderDate){
                return this.orderDetail.orderDate.substring(0, 10)
            }else{
                return null
            }
        },
        totalFee(){
            let fee = 0
            if(this.orderDetail.odetails){
                for(let item of this.orderDetail.odetails){
                    fee = fee + item.odetailPrice * item.odetailNum
                }
                fee = fee + this.orderDetail.orderPostalfee
            }
            return fee
        }
    },
    methods:{
        pay(){
            // let form = this.$refs.form
            // form.action = this. BaseUrl + '/pay'
            // form.method = 'post'
            // form.submit()
            this.$router.push({
                path:'/pay',
            })
        }
    },
    created(){
        let orderId = this.$route.params.orderId
        this.axios.get('/order/getOrderDetailById', {params:{orderId}})
        .then((res)=>{
            console.log(res);
            this.orderDetail = res.data.orderDetail
        })
    }
}
</script>

<style lang="scss" scoped>

</style>