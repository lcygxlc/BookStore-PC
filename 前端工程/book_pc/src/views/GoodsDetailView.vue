<template>
    <cate-bar></cate-bar>
    <div class="col-md-12">
        <div class="col-md-3">
            <cate-menu :activeCateId="activatedCateId"></cate-menu>
        </div>
        <div class="col-md-7 goods-detail-wrapper">
            <product-detail :product="product"></product-detail>
        </div>
        <div class="col-md-2"></div>
    </div>
</template>
  <script>
import CateMenu from '../components/CateMenu.vue'
import ProductDetail from '../components/ProductDetail.vue'
import CateBar from '../components/CateBar.vue'
export default {
    components: {
        CateMenu,
        ProductDetail,
        CateBar
    },
    data() {
        return {
            activatedCateId: 0,
            product: {}
        }
    },
    created() {
        let goodsId = this.$route.params.goodsId
        this.axios
            .get('/goods/getGoodsDetailById', { params: { goodsId: goodsId } })
            .then((res) => {
                this.product = {
                    ...res.data.goodsDetail
                }
                this.activatedCateId = this.product.cateId
            })
    }
}
</script>
  