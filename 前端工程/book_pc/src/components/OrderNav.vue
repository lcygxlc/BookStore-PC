<template>
    <div class="list-group">
        <ul class="nav nav-pills nav-stacked" id="left_order">
            <li :class="{active:currentStatus === 'all'}">
                <a @click.prevent="changeStatus('all')">全部订单</a>
            </li>
            <li :class="{active:currentStatus === 0}">
                <a @click.prevent="changeStatus(0)">待付款订单</a>
            </li>
            <li :class="{active:currentStatus === 1}">
                <a @click.prevent="changeStatus(1)">待发货订单</a>
            </li>
            <li :class="{active:currentStatus === 4}">
                <a @click.prevent="changeStatus(4)">待收货订单</a>
            </li>
            <li :class="{active:currentStatus === 8}">
                <a @click.prevent="changeStatus(8)">已退货订单</a>
            </li>
            <li :class="{active:currentStatus === 5}">
                <a @click.prevent="changeStatus(5)">交易成功订单</a>
            </li>
            <li :class="{active:currentStatus === 9}">
                <a @click.prevent="changeStatus(9)">交易关闭订单</a>
            </li>
        </ul>
    </div>
</template>

<script>
    export default {
        data(){
            return {
                currentStatus:"all"
            }
        },
        methods:{
            changeStatus(status){
                if(this.currentStatus != status){
                    this.currentStatus = status
                    this.$emit('status', status)
                }
            }
        },
    }
</script>

<style lang="scss" scoped>

</style>