<template>
    <div>
        <div>
            <button class="btn btn-primary" type="button" @click="addNewAddress()">添加收货地址</button>
        </div>
        <div class="container-fluid">
            <a ref="confirmModal" href="#confirmModal" data-toggle="modal" style="display: none;"></a>
            <div class="modal fade" id="confirmModal" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form class="form-inline" role="form" id="addrForm" method="post">
                            <div class="modal-header">
                                <button class="close" aria-hidden="true" type="button" data-dismiss="modal">
                                    ×
                                </button>
                                <h1 class="modal-title">删除操作</h1>
                            </div>
                            <div class="modal-body">
                                您确认删除此地址吗？
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary" @click.prevent="removeAddr">确定</button>
                                <button ref="confirmCloseModal" class="btn btn-default" type="button"
                                    data-dismiss="modal">
                                    关闭
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!--  添加收货地址模态框 -->
            <a ref="addressFormModal" href="#addressFormModal" data-toggle="modal" style="display: none;"></a>
            <div class="modal fade" id="addressFormModal" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="" class="form-inline" role="form" id="addrForm" method="post">
                            <div class="modal-header">
                                <button class="close" aria-hidden="true" type="button" data-dismiss="modal"> × </button>
                                <h4 class="modal-title">添加 | 收货地址</h4>
                                <div class="modal-body">
                                    <input type="hidden" id="addrId" name="addrId" v-model="addr.addrId">
                                    <div class="form-group">
                                        <label
                                            for="addrProvince">省&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <input type="text" class="form-control" id="addrProvince" name="addrProvince"
                                            v-model="addr.addrProvince" placeholder="输入省份信息" required>
                                    </div>&nbsp;&nbsp;
                                    <div class="form-group">
                                        <label
                                            for="addrCity">市&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <input type="text" class="form-control" id="addrCity" name="addrCity"
                                            v-model="addr.addrCity" placeholder="输入市信息" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="addrArea">区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <input type="text" class="form-control" id="addrArea" name="addrArea"
                                            v-model="addr.addrArea" placeholder="输入市信息" required>
                                    </div>&nbsp;&nbsp;
                                    <div class="form-group">
                                        <label for="addrContent">街道&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <input type="text" class="form-control" id="addrContent" name="addrContent"
                                            v-model="addr.addrContent" placeholder="输入街道信息" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="addrReceiver">收件人&nbsp;</label>
                                        <input type="text" class="form-control" id="addrReceiver" name="addrReceiver"
                                            v-model="addr.addrReceiver" placeholder="输入收件人姓名" required>
                                    </div>&nbsp;&nbsp;
                                    <div class="form-group">
                                        <label for="addrTel">手机号&nbsp;&nbsp;</label>
                                        <input type="text" class="form-control" id="addrTel" name="addrTel"
                                            v-model="addr.addrTel" placeholder="输入手机号" required>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary" type="button" @click="addOrUpdateAddress">确定</button>
                                <button class="btn btn-default" ref="addrCloseModal" type="button"
                                    data-dismiss="modal">关闭</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <table class="table table-condensed table-hover">
            <thead>
                <tr>
                    <th>序号</th>
                    <th>省 - 市 - 区</th>
                    <th>街道</th>
                    <th>收件人</th>
                    <th>手机号</th>
                    <th>默认地址</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(address, index) in addresses" :key="address.addrId">
                    <td>{{ index + 1 }}</td>
                    <td>{{ address.addrProvince + "省" + address.addrCity + "市" + address.addrArea + "区" }}</td>
                    <td>{{ address.addrContent }} 街道</td>
                    <td>{{ address.addrReceiver }}</td>
                    <td>{{ address.addrTel }}</td>
                    <td class="isDefault">默认地址</td>
                    <td>
                        <a href="#" @click="handleUpdateAddress(address)">修改 | </a>
                        <a href="#" @click="handleDeleteAddress(address)">删除</a>
                        <a href="#" v-if="address.addrIsDefault == 0" @click="setDefault(address)"> | 设为默认地址</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
    data() {
        return {
            addr: {}
        }
    },
    computed: {
        ...mapGetters({
            addresses: 'user/addresses'
        })
    },
    methods: {
        //添加收货地址弹出对话框
        addNewAddress() {
            this.addr = { addrId: 0, addrIsDefault: 0 }
            this.$refs.addressFormModal.click()
        },
        addOrUpdateAddress() {
            this.$store.dispatch('user/addOrUpdateAddress', {
                address: this.addr,
                success: () => {
                    this.$refs.addrCloseModal.click()
                },
                false: () => {
                    this.$refs.addrCloseModal.click()
                }
            })
        },
        handleUpdateAddress(address) {
            this.addr = address
            this.$refs.addressFormModal.click()
        },
        handleDeleteAddress(address) {
            this.addr = address
            this.$refs.confirmModal.click()
        },
        removeAddr() {
            console.log("222");
            this.$store.dispatch('user/removeAddress', {
                address: this.addr,
                success: () => {
                    this.$refs.confirmCloseModal.click()
                },
                false: () => {
                    this.$refs.confirmCloseModal.click()
                }
            })
        },
        setDefault(address) {
            this.$store.dispatch('user/setDefaultAddress', {
                address,
                success: () => {
                    this.$store.dispatch('user/fetchUserAddress')
                }
            })
        }
    },
    created() {
        if (this.addresses.length == 0) {
            this.$store.dispatch('user/fetchUserAddress')
        }
    }
}
</script>

<style lang="scss" scoped></style>