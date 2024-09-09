<template>
    <div class="col-md-10 col-md-offset-1">
        <div class="panel home-goods">
            <div class="panel-heading">
                <i class="line"></i>
                <h3>新品推荐 New &amp; Recomend</h3>
            </div>
            <div class="panel-body">
                <div
                    id="newGoodsCarousel"
                    class="carousel slide goods"
                    data-ride="carousel"
                >
                    <div id="newGoods" class="carousel-inner">
                        <div class="item goods active left">
                            <div class="row">
                                <div
                                    class="col-md-2"
                                    v-for="p in products.slice(0, 6)"
                                    :key="p.goodsId"
                                >
                                    <product-vue :product="p"></product-vue>
                                </div>
                            </div>
                        </div>
                        <!-- </div>
                    <div id="newGoods" class="carousel-inner"> -->
                        <div class="item goods next left">
                            <div class="row">
                                <div
                                    class="col-md-2"
                                    v-for="p in products.slice(6, 12)"
                                    :key="p.goodsId"
                                >
                                    <product-vue :product="p"></product-vue>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 左箭头 -->
                    <a
                        href="#newGoodsCarousel"
                        class="left carousel-control"
                        role="button"
                        data-slide="prev"
                    >
                        <span
                            class="glyphicon glyphicon-chevron-left"
                            aria-hidden="true"
                        ></span>
                    </a>
                    <!-- 右箭头 -->
                    <a
                        href="#newGoodsCarousel"
                        class="right carousel-control"
                        role="button"
                        data-slide="prev"
                    >
                        <span
                            class="glyphicon glyphicon-chevron-right"
                            aria-hidden="true"
                        ></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import ProductVue from './Product.vue'
export default {
    props: ['products'],
    components: {
        ProductVue
    }
}
</script>

<style>
</style>