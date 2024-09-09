<template>
  <h2>1326 张三的首页</h2>
  <section>
    <router-link to="/show">首页</router-link>
    <router-link to="/">栏目首页</router-link>
    <router-link to="/">详情页面</router-link>
    <router-link to="/">搜索</router-link>
    <router-link to="/">登录</router-link>
    <router-link to="/">注册</router-link>
  </section>
</template>
<script></script>
<style scoped>
h2 {
  line-height: 100px;
  font-size: 33px;
  background-color: #333;
  color: #fff;
  text-align: center;
  letter-spacing: 5px;
  transition: 16s all;
}
section {
  display: flex;
  flex-wrap: wrap;
  padding: 20px;
  margin: 10px;
}
a {
  line-height: 33px;
  font-size: 20px;
  color: #fff;
  background-color: #333;
  transition: all 0.4s;
  margin: 8px;
  padding: 5px 40px;
  overflow: hidden;
}
a:hover {
  background-color: #033;
  color: #eee;
  transform: scale(1.12);
  text-decoration: none;
  letter-spacing: 3px;
}
h2:hover{ 
  background-color: #033;
}
</style>
