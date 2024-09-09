<template>
    <div class="modal fade" id="cartModal" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button
                        class="close"
                        aria-hidden="true"
                        data-dismiss="modal"
                        type="button"
                    >
                        x
                    </button>
                    <h4 class="modal-title" id="cartIitle">我的购物车</h4>
                </div>
            </div>
            <form action="" class="form-inline" role="form" method="POST">
                <div class="modal-body">
                    <div class="table-responsive">
                        <table
                            class="table table-hover table-striped table-condensed"
                        >
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>商品图片</th>
                                    <th>商品名称</th>
                                    <th>商品单价</th>
                                    <th>数量</th>
                                    <th>小计</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr
                                    v-for="(item, index) in cartItems"
                                    :key="item.goodsId"
                                >
                                    <td>{{ index + 1 }}</td>
                                    <td>
                                        <img
                                            :src="prefix(item.pic)"
                                            alt=""
                                            width="50"
                                            height="50"
                                        />
                                    </td>
                                    <td>
                                        <router-link
                                            :to="{
                                                name: 'GoodsDetail',
                                                params: { goodsId: item.goodsId }
                                            }"
                                            >{{ item.goodsName }}</router-link
                                        >
                                    </td>
                                    <td>
                                        原价<span
                                            class="glyhicon glyphicon-yen"
                                            aria-hidden="true"
                                        >
                                            {{ item.goodsPrice }}<br />现售<span
                                                class="glyhicon glyphicon-yen"
                                                aria-hidden="true"
                                            ></span></span
                                        >{{ item.goodsDiscount }}
                                    </td>
                                    <td>
                                        <div
                                            class="input-group input-group-sm col-xs-5"
                                        >
                                            <input
                                                v-model="item.num"
                                                type="number"
                                                class="form-control input-small"
                                            />
                                        </div>
                                    </td>
                                    <td
                                        class="glyhicon glyphicon-yen"
                                        aria-hidden="true"
                                    >
                                        <span>{{
                                            item.num * item.goodsDiscount
                                        }}</span>
                                    </td>
                                    <td>
                                        <a href="#" @click="delCartItem(item)"
                                            >删除</a
                                        >
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <a href="" @click="clearCart()">清空购物车</a>
                    <div class="text-right">
                        已选{{ cartItems.length }}
                        件商品&nbsp;&nbsp;合计（不含运费）
                        <span class="glyhicon glyphicon-yen" aria-hidden="true">
                            {{ totalFee }}</span
                        >
                    </div>
                </div>
                <div class="modal-footer">
                    <button
                        class="btn btn-primary"
                        :disabled="cartItems.length == 0"
                        type="button"
                        @click="toCheckout()"
                    >
                        去结算
                    </button>
                    <button
                        ref="closeCartModal"
                        class="btn btn-default"
                        type="button"
                        data-dismiss="modal"
                    >
                        关闭
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>
<script>
import { mapGetters } from 'vuex'
export default {
    computed: {
        ...mapGetters({
            cartItems: 'order/cartItems'
        }),
		// 计算总价
        totalFee() {
            let totalFee = 0
            for (let item of this.cartItems) {
                totalFee = totalFee + item.num * item.goodsDiscount
            }
            return totalFee
        }
    },

    methods: {
        // 删除
        delCartItem(item) {
            this.$store.dispatch('order/deleteCartItem', item)
        },
        // 清空购物车
        clearCart() {
            this.$store.dispatch('order/clearCartItems')
        },
        // 去结算
        toCheckout() {
            this.$store.dispatch('order/toCheckout', {
                success: () => {
                    this.$refs.closeCartModal.click()
                    this.$router.push({
                        name: 'CheckOut',
                        params: { type: 'cart' },
                        props: true
                    })
                },
                fail: () => {
                    this.$toast('结算失败！')
                }
            })
        }
    }
}
</script>
<style scoped>
.form-inline {
    background: white;
}
</style>