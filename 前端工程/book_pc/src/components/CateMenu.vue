<template>
<div class="list-group">
    <ul class="nav nav-pills nav-stacked affix-top" id="left_cate">
        <router-link v-for="cate in cates" :key="cate.cateId" :class="{active:cate.cateId==activeCateId}"
        class="list-group-item" :to="{name:'CateView',params:{cateId:cate.cateId}}">{{ cate.cateName }}</router-link>
    </ul>
</div>
</template>
<script >
import { mapGetters } from 'vuex';
export default{
    props:{activeCateId:{type:String,require:false,default:'0'}},
    computed:{
    ...mapGetters({
        cates:'cate/cates'
    })
},
created(){
    if(this.cates && this.cates.length==0){
        this.$store.dispatch('cate/fetchCates')
    }
}

}



</script>