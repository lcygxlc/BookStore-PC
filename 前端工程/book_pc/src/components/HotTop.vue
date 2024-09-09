<template>
    <div class="col-md-10 col-md-offset-1">
        <div class="panel home-goods">
            <div class="panel-heading">
                <i class="line"></i>
                <h3>热品排行 Sales &amp; Top</h3>
            </div>
            <div class="panel-body">
                <div
                    id="salesGoodsCarousel"
                    class="carousel slide goods"
                    data-ride="carousel"
                >
                    <div id="salesGoods" class="carousel-inner">
                        <div class="item goods active left">
                            <div class="row">
                                <div
                                    class="col-md-2"
                                    v-for="p in products.slice(0, 6)"
                                    :key="p.goodsId"
                                >
                                    <product-hot-top
                                        :product="p"
                                    ></product-hot-top>
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
                                    <product-hot-top
                                        :product="p"
                                    ></product-hot-top>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 左箭头 -->
                    <a
                        href="#salesGoodsCarousel"
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
                        href="#salesGoodsCarousel"
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
import ProductHotTop from './ProductHotTop.vue'
export default {
    props: ['products'],
    components: {
        ProductHotTop
    }
}
</script>

<style>
</style>