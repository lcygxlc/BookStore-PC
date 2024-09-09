<template>
    <div class="panel panel-info">
        <div class="panel-heading">
            下单日期：{{ orderDate }} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            订单号：<router-link :to="{name:'OrderDetail',params:{
                orderId:order.orderId
            }}">{{ order.orderCode }}</router-link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            订单状态：<span>{{ orderStatus }}</span>
        </div>
        <div class="panel-body">
            <table class="table table-hover table-condensed table-bordered">
                <tbody>
                    <tr v-for="item in order.odetails" :key="item.odetailId">
                        <td>
                            <img :src="prefix(item.odetailPic)" alt="暂无图片" width="30" height="30">
                        </td>
                        <td>
                            <router-link :to="{name:'GoodsDetail',params:{
                            goodsId:item.goodsId
                        }}">{{ item.odetailName }}&nbsp;&nbsp;</router-link>
                        </td>
                        <td>
                            <span class="glyphicon glyphicon-yen" aria-hidden="true">{{ item.odetailPrice }}</span>
                        </td>
                        <td>{{ item.odetailNum }}件</td>
                        <td>{{ item.odetailPrice * item.odetailNum }} 元</td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <tbody>
                    <td>
                        <router-link class="btn btn-info" :to="{name:'OrderDetail',params:{orderId:order.orderId}}">
                            查看订单
                        </router-link>
                    </td>
                    <td class="text-right">
                        总金额（含运费{{ order.orderPostalfee }}元）： {{ totalFee }}元
                    </td>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
    export default {
        props:['order'],
        computed:{
        orderStatus(){
            let status = ""
            switch (this.order.orderStatus) {
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
            if(this.order && this.order.orderDate){
                return this.order.orderDate.substring(0, 10)
            }else{
                return null
            }
        },
        totalFee(){
            let fee = 0
            if(this.order.odetails){
                for(let item of this.order.odetails){
                    fee = fee + item.odetailPrice * item.odetailNum
                }
                fee = fee + this.order.orderPostalfee
            }
            return fee
        }
    },
    }
</script>

<style lang="scss" scoped>

</style>