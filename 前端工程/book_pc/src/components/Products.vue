<template>
    <div class="row">
        <template v-if="products.list && products.list.length > 0">
            <div class="col-md-2" v-for="p in products.list" :key="p.goodsId">
                <product :product="p"></product>
            </div>
        </template>
        <div class="col-md-6 col-md-offset-3 text-center" v-if="!products.list || products.list.length == 0" role="alert">
            <span class="alert alert-danger"> 对不起，暂无此商品信息！ </span>
        </div>
    </div>
    <table align="right">
      <tbody>
        <tr>
          <td>
            <nav aria-label="Page navgation">
              <ul class="pagination pagination-right">
                <li>
                  <a href="" aria-label="Previous" @click.prevent="switchPage(products.pageNo - 1)">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <li v-for="idx in products.totalPage" :key="idx">
                  <a href="" @click.prevent="switchPage(idx)">{{ idx }}</a>
                </li>
                <li>
                  <a href="" aria-label="Next"  @click.prevent="switchPage(products.pageNo + 1)">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          </td>
        </tr>
      </tbody>
    </table>
</template>
<script>
import Product from './Product.vue';


export default {
  components: {
    Product
  },
  props: ['cateId'],
  name: 'Products',
  data() {
    return {
      products: {}
    }
  },
  methods: {
    fechProductsByCate(cateId,pageNo){
      let params = {cateId}
      if(pageNo){
        params = {cateId,pageNo}
      }
      this.axios.get('/goods/getGoodsByCate', {params})
      .then((res) => {
        this.products = res.data.goods
      })
    },
    // 分页切换
    switchPage(no){
      let pageNo = no
      if(pageNo<1){
        pageNo = 1
      }else if(pageNo > this.products.totalPage){
        pageNo = this.products.totalPage
      }
      if(pageNo != this.products.totalPage){
        this.fechProductsByCate(this.cateId,pageNo)
      }
    }
  },
  created(){
    this.fechProductsByCate(this.cateId)
  },
  watch: {
    cateId(newId) {
      this.axios
        .get("/goods/getGoodsByCate", { params: { cateId: newId } })
        .then((res) => {
          this.products = res.data.goods;
        })
    }
  }
}
</script>
<style>


</style>