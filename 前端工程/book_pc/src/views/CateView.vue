<template>
   <CateBar></CateBar>
   <div class="row">
   <div class="col-md-12">
    <div class="row">
        <div class="col-md-2">
            <CateMenu :activeCateId="cateId"></CateMenu>

        </div>
        <div class="col-md-10">
           <Products :cateId="cateId"></Products>

        </div>
        
    </div>
    </div>
   </div>
   
</template>
<script>
import CateBar from '../components/CateBar.vue';
import CateMenu from '../components/CateMenu.vue';
import Products from '../components/Products.vue';
export default{
    name:'CateView',
    components:{
       CateBar,
       CateMenu,
       Products
    },
beforeRouteUpdate(to){
this.cateId=to.params.cateId
},
created(){
    this.cateId=this.$route.params.cateId
}

}
</script>