<template>
    <div class="goods-item">
        <router-link
            :to="{ name: 'GoodsDetail', params: { goodsId: product.goodsId } }"
        >
            <img :src="prefix(product.goodsPic)" :alt="product.goodsName" />
            <div class="goods-item-detail lineLimit">
                {{ product.goodsName }}
            </div>
            <div class="theme-color text-right">
                <em>￥</em>
                <span class="price">{{ product.goodsDiscount }}</span>
                <span class="ori-price">
                    <s>{{ product.goodsPrice }}</s>
                </span>
            </div>
        </router-link>
    </div>
</template>

<script>
export default {
    props: ['product']
}
</script>


<style scoped>
.lineLimit {
    font-size: 11px;
    overflow: hidden;
    text-overflow: ellipsis;
    /*设置成弹性盒子 */
    display: -webkit-box;
    /*显示的个数 */
    -webkit-line-clamp: 1;
    /* 属性规定框的子元素应该被水平或垂直排列。 */
    -webkit-box-orient: vertical;
}
/* 全局CSS */
.goods-item {
    padding: 0 10px 10px;
    background-color: #fff;
    margin-bottom: 15px;
}

.goods-item img {
    width: 100%;
}

.goods-item {
    padding-top: 1px;
    position: relative;
    z-index: 0;
}

.goods-item::after {
    content: ' ';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
}

.goods-item:hover::after {
    border: 1px solid #ff053b;
}

.goods-item h3 {
    font-size: 16px;
    margin: 0;
    line-height: 30px;
}

.goods-item a {
    color: #777;
}

.goods-item a:hover {
    text-decoration: none;
    font-weight: normal;
}

.goods-item .price {
    font-size: 16px;
}

.goods-item s,
.goods-item .ori-price {
    color: #5a5a5a;
}

.goods-item div {
    line-height: 24px;
}

.goods-item .sales {
    font-size: 14px;
}

.col-md-2 {
    margin-bottom: 15px;
}
</style>