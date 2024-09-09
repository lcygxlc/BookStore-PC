<template>
    <cate-bar></cate-bar>
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <ul class="nav nav-pills nav-stacked" id="left_cate">
                    <li>
                        <router-link :to="{name:'myinfo'}"> 管理个人信息</router-link>
                    </li>
                    <li>
                        <router-link :to="{name:'myaddress'}"> 管理收货地址</router-link>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-10">
            <router-view></router-view>
        </div>
    </div>
</template>

<script>
import CateBar from '../components/CateBar.vue';
    export default {
        components:{
            CateBar
        }
        
    }
</script>

<style lang="scss" scoped>

</style>