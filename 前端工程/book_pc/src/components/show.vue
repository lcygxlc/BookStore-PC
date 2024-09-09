<template>
    <div>
        <thead>
            <tr>
                <th>goodsId</th>
                <th>cateId</th>
                <th>goodsName</th>
                <th>goodsDisc</th>
                <th>goodsPrice</th>
                <th>goodsDiscount</th>
                <th>goodsStock</th>
                <th>goodsOrigin</th>
                <th>goodsMaterial</th>
                <th>goodsPostalfee</th>
                <th>goodsDate</th>
                <th>goodsSales</th>
                <th>goodsPic</th>
                <th>goodsPicFile</th>
                <th>pics</th>
            </tr>
        </thead>
        <tbody>
        <tr>
            <th>{{ goodsData.goodsDetail.goodsId }}</th>
            <th>{{ goodsData.goodsDetail.cateId }}</th>
            <th>{{ goodsData.goodsDetail.goodsName }}</th>
            <th>{{ goodsData.goodsDetail.goodsDisc }}</th>
            <th>{{ goodsData.goodsDetail.goodsPrice }}</th>
            <th>{{ goodsData.goodsDetail.goodsDiscount }}</th>
            <th>{{ goodsData.goodsDetail.goodsStock }}</th>
            <th>{{ goodsData.goodsDetail.goodsOrigin }}</th>
            <th>{{ goodsData.goodsDetail.goodsMaterial }}</th>
            <th>{{ goodsData.goodsDetail.goodsPostalfee }}</th>
            <th>{{ goodsData.goodsDetail.goodsDate }}</th>
            <th>{{ goodsData.goodsDetail.goodsSales }}</th>
            <th>{{ goodsData.goodsDetail.goodsPic }}</th>
            <th>{{ goodsData.goodsDetail.goodsPicFile }}</th>
            <th>{{ goodsData.goodsDetail.pics }}</th>
            
        </tr>
    </tbody>
    </div>
</template>

<script setup>
import axios from 'axios';
import { reactive } from 'vue';

let goodsData=reactive({
    msg:'',
    code: '',
    goodsDetail:{},

});
const goodsDataLoad = () => {
   
    axios.get('/goods/getGoodsDetailById?goodsId=1')
        .then(res => {
            goodsData.goodsDetail = res.data.goodsDetail;
            console.log(goodsData.goodsDetail);
        }).catch(error => {
            console.log(error)
        })
    
};
goodsDataLoad()

</script>

<style>
table{
    width: 100%;
    border-collapse: collapse;
}

table caption{
    font-size: 2em;
    font-weight: bold;
    margin: 1em 0;
}

th,th{
    border: 1px solid #999;
    text-align: center;
    padding: 20px 0;
}

table thead tr{
    background-color: #008c8c;
    color: #fff;
}

table tbody tr:nth-child(odd){
    background-color: #eee;
}

table tbody tr:hover{
    background-color: #ccc;
}

table tbody tr th:first-child{
    color: #f40;
}


</style>