<template>
    <SearchBar @keyword="search"></SearchBar>
    <template v-if="searchResult.list && searchResult.list.length > 0">
        <div class="row">
            <div class="col-md-2" v-for="product of searchResult.list" :key="product.goodsId">
                <product :product="product"></product>
            </div>
        </div>
    </template>
    <template v-else>
        <div class="col-md-6 col-md-offset-3 text-center" v-if="searchResult.list || searchResult.list.length == 0"
            role="alert">
            <span class="alert alert-danger">对不起，暂无此商品</span>
        </div>
    </template>
</template>
<script>
import Product from '../components/Product.vue'
import SearchBar from '../components/SearchBar.vue'

export default {
    components: {
        SearchBar,
        Product
    },
    data() {
        return {
            searchResult: {
                list:[],
            },
        }
    },
    methods: {
        search(keyword) {
            this.$router.push({
                name: "search",
                params: { keyword: keyword },
                props: true
            })
        },
        searchProducts(keyword) {
            let params = { keyword: keyword };
            this.axios.get('/goods/searchGoods', { params }).then((res) => {
                if (res.data.code == 0) {
                    this.searchResult = res.data.searchGoods
                }
            })
        },
    },
//简化地址
    beforeRouteUpdate(to) {
        this.keyword = to.params.keyword;
        this.searchProducts(this.keyword);
    },
    created() {
        this.keyword = this.$route.params.keyword
        this.searchProducts(this.keyword)
    }
};
</script>

<style></style>