<template>
    <div class="col-md-8 col-md-offset-2">
        <ul class="cate-nav">
            <div class="navbar-header">
                <a class="navbar-brand" href="">久忆小说平台</a>
            </div>
            <li class="cate" @mouseover="showMenu = 'block'" @mouseout="showMenu = 'none'">
                商品分类
                <ul id="dropdown_cate" :style="{ display: showMenu }">
                    <li v-for="cate in cates" :key="cate.cateId">
                        <router-link :to="{ name: 'CateView', params: { cateId: cate.cateId } }"> {{ cate.cateName
                            }}</router-link>
                    </li>
                </ul>
            </li>
            <li v-for="cate in cates.slice(0, 4)" :key="cate.id">
                <router-link :to="{ name: 'CateView', params: { cateId: cate.cateId } }"> {{ cate.cateName }}</router-link>
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    props: ['cates'],
    data() {
        return {
            showMenu: 'none'
        }
    }
}
</script>

<style>
@charset "UTF-8";

* {
    padding: 0;
    margin: 0;
}

body {
    background-color: #f5f5f5;
}

.container-fluid {
    padding: 0;
}

div {
    display: block;
}

ul,
li {
    list-style: none;
    padding: 0;
    margin: 0;
}

.col-md-12 {
    padding: 0;
}

.cate-nav {
    display: flex;
    height: 36px;
    font-weight: 500;
    font-size: 16px;
    color: #333;
    line-height: 36px;
}

.cate-nav,
.cate-nav li {
    list-style: none;
}

.cate-nav a {
    display: block;
    height: 36px;
    line-height: 36px;
    text-decoration: none;
    color: #333;
    padding: 0 20px;
    text-align: center;
}

.cate-nav li.cate {
    color: #f0f0f0;
    text-align: center;
    width: 150px;
    background: #C60A0A;
    position: relative;
    margin-right: 10px;
}

.cate-nav #dropdown_cate {
    padding: 0;
    position: absolute;
    top: 36px;
    left: 0;
    z-index: 1;
    background-color: rgba(0, 0, 0, 0.55);
    width: 150px;
}

.cate-nav #dropdown_cate a {
    color: #fff;
}
</style>