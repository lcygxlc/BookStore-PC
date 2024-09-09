<template>
    <div class="row">
        <div class="col-md-4 col-md-offset-4 search-wrapper">
            <form action="search" class="search-form">
                <input type="text" class="search-input" placeholder="今日图书" name="keyword" v-model="keyword" />
                <input type="button" class="search-btn" @click="search" value="搜索" />
            </form>
        </div>
    </div>
</template>

<script>
export default {
    emits: ["keyword"],
    data() {
        return {
            keyword: ""
        }
    },
    methods: {
        search() {
            this.$emit("keyword", this.keyword)
        }
    }
}
</script>

<style>
.search-form {
    height: 100px;
    align-content: center;

}

.search-input {

    width: 300px;
}

.search-btn {
    color: white;
    background-image: linear-gradient(to right, #f2e9ea 0%, #b0cfff 99%);
    width: 55px;
    height: 26px;
    margin-left: 10px;
    border: 0px solid;
}
</style>