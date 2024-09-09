<template>
    <div class="container-fluid">
        <a
            ref="confirmModal"
            href="#confirmModal"
            data-toggle="modal"
            style="display: none"
        ></a>
        <div
            class="modal fade"
            id="confirmModal"
            role="dialog"
            aria-hidden="true"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <form
                        class="form-inline"
                        role="form"
                        id="addrForm"
                        method="post"
                    >
                        <div class="modal-header">
                            <button
                                class="close"
                                aria-hidden="true"
                                type="button"
                                data-dismiss="modal"
                            >
                                ×
                            </button>
                            <h4 class="modal-title">确认</h4>
                        </div>
                        <div class="modal-body">确认删除该地址吗？</div>
                        <div class="modal-footer">
                            <button
                                class="btn btn-primary"
                                @click="performRemoveAddr"
                                type="button"
                            >
                                确定
                            </button>
                            <button
                                ref="confirmCloseModal"
                                class="btn btn-default"
                                type="button"
                                data-dismiss="modal"
                            >
                                关闭窗口
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <a
            ref="addressFormModal"
            href="#addressFormModal"
            data-toggle="modal"
            style="display: none"
        ></a>
        <div
            class="modal fade"
            id="addressFormModal"
            role="dialog"
            aria-hidden="true"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <form
                        class="form-inline"
                        role="form"
                        id="addrForm"
                        method="post"
                    >
                        <div class="modal-header">
                            <button
                                class="close"
                                aria-hidden="true"
                                type="button"
                                data-dismiss="modal"
                            >
                                ×
                            </button>
                            <h4 class="modal-title">添加/修改收货地址</h4>
                        </div>
                        <div class="modal-body">
                            <input
                                type="hidden"
                                id="addrId"
                                name="addrId"
                                v-model="addr.addrId"
                            />
                            <div class="form-group">
                                <label for="addrProvince">
                                    省&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </label>
                                <input
                                    class="form-control"
                                    name="addrProvince"
                                    v-model="addr.addrProvince"
                                    id="addrProvince"
                                    type="text"
                                    placeholder="省"
                                    required
                                />
                            </div>
                            <div class="form-group">
                                <label for="addrCity"
                                    >&nbsp;
                                    市&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label
                                >
                                <input
                                    class="form-control"
                                    name="addrCity"
                                    v-model="addr.addrCity"
                                    id="addrCity"
                                    type="text"
                                    placeholder="市"
                                    required
                                />
                            </div>
                            <div class="form-group">
                                <label for="addrArea">
                                    区
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label
                                >
                                <input
                                    class="form-control"
                                    name="addrArea"
                                    v-model="addr.addrArea"
                                    id="addrArea"
                                    type="text"
                                    placeholder="区"
                                    required
                                />
                            </div>
                            <div class="form-group">
                                <label for="addrContent"
                                    >&nbsp; 街道 &nbsp;&nbsp;&nbsp;&nbsp;</label
                                >
                                <input
                                    class="form-control"
                                    name="addrContent"
                                    v-model="addr.addrContent"
                                    id="addrContent"
                                    type="text"
                                    placeholder="街道"
                                    required
                                />
                            </div>
                            <div class="form-group">
                                <label for="addrReceiver"> 收件人 </label>
                                <input
                                    class="form-control"
                                    name="addrReceiver"
                                    v-model="addr.addrReceiver"
                                    id="addrReceiver"
                                    type="text"
                                    placeholder="收件人"
                                    required
                                />
                            </div>
                            <div class="form-group">
                                <label for="addrTel">
                                    &nbsp;手机号 &nbsp;</label
                                >
                                <input
                                    class="form-control"
                                    name="addrTel"
                                    v-model="addr.addrTel"
                                    id="addrTel"
                                    type="text"
                                    placeholder="联系电话"
                                    required
                                />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button
                                class="btn btn-primary"
                                @click="createOrUpdateAddress"
                                type="button"
                            >
                                确定
                            </button>
                            <button
                                ref="addrCloseModal"
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
        </div>
        <div class="row">
            <form action="">
                <div class="col-md-10 col-md-offset-1" id="myAddress">
                    <h3>收货地址列表</h3>
                    <table class="table table-condensed table-hover">
                        <tbody>
                            <tr
                                v-for="address in addresses"
                                :key="address.addrId"
                            >
                                <td>
                                    <div class="radio">
                                        <label>
                                            <input
                                                type="radio"
                                                name="address"
                                                v-model="fullAddress"
                                                :value="
                                                    address.addrProvince +
                                                    address.addrCity +
                                                    address.addrArea +
                                                    address.addrContent +
                                                    '(' +
                                                    address.addrReceiver +
                                                    '收)' +
                                                    address.addrTel
                                                "
                                                :checked="
                                                    address.addrIsdefault == 1
                                                        ? true
                                                        : false
                                                "
                                            />
                                        </label>
                                    </div>
                                </td>
                                <td>
                                    {{
                                        address.addrProvince +
                                        address.addrCity +
                                        address.addrArea
                                    }}
                                </td>
                                <td>{{ address.addrContent }}</td>
                                <td>
                                    ({{ address.addrReceiver }}收)
                                    {{ address.addrTel }}
                                </td>
                                <td class="isDefault"></td>
                                <td>
                                    <a
                                        href="#"
                                        @click="handleAddressForm(address)"
                                        >修改</a
                                    >
                                    |
                                    <a href="#" @click="removeAddress(address)"
                                        >删除</a
                                    >
                                    |
                                    <a
                                        v-if="address.addrIsdefault == 0"
                                        href="#"
                                        @click="setDefault(address)"
                                    >
                                        设为默认地址</a
                                    >
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button
                        class="btn btn-primary"
                        type="button"
                        @click="addNewAddress()"
                    >
                        添加收货地址
                    </button>
                </div>
                <div class="col-md-10 col-md-offset-1">
                    <h3>订单信息</h3>
                    <table class="table table-hover table-condensed">
                        <thead>
                            <tr>
                                <th>序号</th>
                                <th>商品图片</th>
                                <th>商品名称</th>
                                <th>商品单价</th>
                                <th>数量</th>
                                <th>小计</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr
                                v-for="(item, idx) in cartItems"
                                :key="item.goodsId"
                            >
                                <td>{{ idx + 1 }}</td>
                                <td>
                                    <img
                                        :src="prefix(item.pic)"
                                        width="30"
                                        height="30"
                                    />
                                </td>
                                <td>{{ item.goodsName }}</td>
                                <td>
                                    原价<span
                                        class="glyphicon glyphicon-yen"
                                        aria-hidden="true"
                                    ></span
                                    >{{ item.goodsPrice }} 现售<span
                                        class="glyphicon glyphicon-yen"
                                        aria-hidden="true"
                                    >
                                    </span
                                    >{{ item.goodsDiscount }}
                                </td>
                                <td>{{ item.num }}</td>
                                <td>
                                    <span
                                        class="glyphicon glyphicon-yen"
                                        aria-hidden="true"
                                    ></span>
                                    {{ item.num * item.goodsDiscount }}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-condensed">
                        <tbody>
                            <tr>
                                <td class="text-right">
                                    运费：<span
                                        class="glyphicon glyphicon-yen"
                                        aria-hidden="true"
                                    >
                                    </span
                                    >{{ postFee }}
                                </td>
                            </tr>
                            <tr>
                                <td class="text-right">
                                    合计（含运费）：<span
                                        class="glyphicon glyphicon-yen"
                                        aria-hidden="true"
                                    >
                                    </span
                                    >{{ totalFee }}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div></div>
                    <div class="col-md-12 text-right">
                        <button
                            id="submitOrder"
                            @click="checkout()"
                            :disabled="fullAddress === ''"
                            class="btn btn-primary"
                            type="button"
                        >
                            提交订单
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</template>
<script>
export default {
    props: ['type', 'cartItems', 'addresses'],
    data() {
        return {
            addr: {}, //记录当前操作的地址信息
            fullAddress: ''
        }
    },
    computed: {
        postFee() {
            let fee = Number.MIN_VALUE
            for (let item of this.cartItems) {
                if (fee < item.goodsPostalfee) {
                    fee = item.goodsPostalfee
                }
            }
            return fee
        },
        totalFee() {
            let fee = Number.MIN_VALUE
            let totalFee = 0
            for (let item of this.cartItems) {
                totalFee = totalFee + item.num * item.goodsDiscount
                if (fee < item.goodsPostalfee) {
                    fee = item.goodsPostalfee
                }
            }
            totalFee = totalFee + fee
            return totalFee
        }
    },
    watch: {
        addresses() {
            this.checkAddress()
        }
    },
    methods: {
        addNewAddress() {
            this.addr = { addrId: 0, addrIsdefault: 0 }
            this.$refs.addressFormModal.click()
        },
        checkAddress() {
            for (let address of this.addresses) {
                if (address.addrIsdefault === 1) {
                    this.fullAddress =
                        address.addrProvince +
                        address.addrCity +
                        address.addrArea +
                        address.addrContent +
                        '(' +
                        address.addrReceiver +
                        '收)' +
                        address.addrTel
                    break
                }
            }
        },
        checkout() {
            this.$store.dispatch('order/checkout', {
                type: this.type,
                data: {
                    address: this.fullAddress,
                    orderPostalfee: this.postFee
                },
                success: (orderId) => {
                    this.$router.push({
                        name: 'OrderDetail',
                        params: { orderId: orderId },
                        props: true
                    })
                }
            })
        }
    },
     //添加或修改收货地址
     addOrUpdateAddress() {
            this.$store.dispatch('user/addOrUpdateAddress', {
                address: this.addr,
                success: () => {
                    this.$refs.addrCloseModal.click()
                },
                fail: () => {
                    this.$refs.addrCloseModal.click()
                }
            })
        },
    created() {
        console.log(this.cartItems)
        this.checkAddress()
    }
}
</script>
