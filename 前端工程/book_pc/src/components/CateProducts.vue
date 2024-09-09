<template>
    <div class="col-md-10 col-md-offset-1">
        <div class="pannel-body">
            <div class="row">
                <div class="pannel-heading">
                    <i class="line"></i>
                    <h3>{{cate.cateName}}
                   <router-link class="btn" :to="{name:'CateView',params:{cateId:cate.cateId}}">
                     查看更多 >></router-link>
                    </h3>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="cate">
                        <img :src="prefix(cate.catePic)" alt="cate.cateName">
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="col-md-3" v-for="product in products.list" :key="product.goodsId">
                        <Product :product="product"></Product>
                    </div>
                </div>        
            </div>
        </div>
    </div>
</template>

<script>
import Product from './Product.vue'
import axios from 'axios'
export default {
    components: { Product },
    props:['cate'],
    data(){
        return{
            products:{}
        }
    },
    created(){
        axios.get("/goods/getGoodsByCate", {
        params:{cateId:this.cate.cateId},
    }).then((res) => {
        this.products = res.data.goods
    });

    },
};

</script>

<style scoped>
.cate img {
  height: 120%;
  width: 100%;
}

.cate {
  text-align: center;
}

.goods-item h3 {
  height: 2em;
}
</style>