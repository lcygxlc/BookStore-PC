<template>
    <!-- 首页搜索框 -->
    <SearchBar @keyword="search"></SearchBar>
    <!-- 商品分类展示-->
    <nav-bar :cates="cates"></nav-bar>
    <!-- 轮播图 -->
    <carousel />
    <!-- 不同分类商品展示 -->
    <cate-products
        v-for="cate in cates.slice(0, 5)"
        :key="cate.cateId"
        :cate="cate"
    ></cate-products>
    <!-- 新品推荐商品 -->
    <new-recommend :products="newGoods"></new-recommend>
    <!-- 热品排行商品 -->
    <hot-top :products="salesGoods"></hot-top>
</template>

<script>
import NavBar from '../components/NavBar.vue'
import Carousel from '../components/Carousel.vue'
import NewRecommend from '../components/NewRecommend.vue'
import HotTop from '../components/HotTop.vue'
import CateProducts from '../components/CateProducts.vue'
import { mapGetters } from 'vuex'
import SearchBar from '../components/SearchBar.vue'

export default {
    name: 'Home',
    components: {
        NavBar,
        Carousel,
        NewRecommend,
        HotTop,
        CateProducts,
        SearchBar
    },
    data() {
        return {
            // cates: [],
            newGoods: [],
            salesGoods: []
        }
    },
    // 通过计算属性拿到所有数据
    computed: {
        ...mapGetters({
            cates: 'cate/cates'
        })
    },
    methods: {
        search(keyword) {
            this.$router.push({
                name: 'search',
                params: { keyword: keyword },
                props: true
            })
        }
    },
    created() {
        // 首页商品分类名称
        // this.axios
        //     .get('http://172.17.18.106:8889/cate/getAllCates')
        //     .then((res) => {
        //         this.cates = res.data.cates
        //     })
        if (this.cates.length == 0) {
            this.$store.dispatch('cate/fetchCates')
        }
        // 获取首页新品推荐商品
        this.axios.get('/goods/getNewGoods').then((res) => {
            this.newGoods = res.data.newGoods
        })
        // 获取首页热品推荐商品
        this.axios.get('/goods/getSalesGoods').then((res) => {
            this.salesGoods = res.data.salesGoods
        })
    }
}
</script>

<style>
</style>