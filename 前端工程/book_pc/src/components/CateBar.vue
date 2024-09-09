<template>
    <div class="col-md-12">
        <nav class="navbar navbar-default navbar-static-top" role="navigation">
            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand">久忆小说平台</a>
            </div>
            <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" id="nav">
                    <li>
                        <router-link :to="{ name: 'Home' }">首页</router-link>
                    </li>
                    <li v-for="cate in cates.slice(0, 4)" :key="cate.cateId">
                        <router-link :to="{ name: 'CateView', params: { cateId: cate.cateId } }">
                            {{ cate.cateName }}

                        </router-link>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</template>
<script>
import { mapGetters } from 'vuex';

export default {
    computed: {
        ...mapGetters({
            cates: 'cate/cates'
        })
    },
    created() {
        if (this.cates && this.cates.length == 0) {
            this.$store.dispatch('cate/fetchCates')
        }
    }

}


</script>