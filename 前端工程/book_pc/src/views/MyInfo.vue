<template>
    <div>
        <v-form @submit="update" :validation-schema="modiForm" v-slot="{ errors }" role="form" id="updateForm">
            <div class="modal-body">
                <div class="form-group">
                    <v-field class="form-control" name="userId" id="userId" type="hidden" :value="logUser.userId"
                        required />
                </div>
                <div class="form-group">
                    <v-field class="form-control" name="userName" id="userName" type="text" :value="logUser.userName"
                        readonly="false" required placeholder="请填写新的用户名称" />
                    <div class="invalid-feedback">{{ errors.userName }}</div>
                </div>
                <div class="form-group">
                    <label for="oldPass"> 旧密码 </label>
                    <v-field class="form-control" name="oldPass" id="oldPass" type="password" placeholder="请填写旧密码"
                        required />
                    <div class="invalid-feedback">{{ errors.oldPass }}</div>
                </div>
                <div class="form-group">
                    <label for="userPass"> 新密码 </label>
                    <v-field class="form-control" id="userPass" name="userPass" type="password" placeholder="请填写新密码"
                        required />
                    <div class="invalid-feedback">{{ errors.userPass }}</div>
                </div>
                <div class="form-group">
                    <label for="userPass1"> 确认密码 </label>
                    <v-field class="form-control" id="userPass1" name="userPass1" type="password" placeholder="请填确认密码"
                        required />
                    <div class="invalid-feedback">{{ errors.userPass1 }}</div>
                </div>
                <div class="form-group">
                    <label for="userAge"> 年龄</label>
                    <v-field class="form-control" name="userAge" id="userAge" type="number" :value="logUser.userAge"
                        placeholder="请填写新的年龄" />
                    <div class="invalid-feedback">{{ errors.userAge }}</div>
                </div>
                <div class="form-group">
                    <label for="userSex"> 性别 </label>
                    <div class="radio">
                        <label>
                            <v-field type="radio" name="userSex" id="sex1" value="0" checked
                                v-model="logUser.userSex" />
                            男
                        </label>
                        &nbsp;
                        <label>
                            <v-field type="radio" name="userSex" id="sex2" value="1" v-model="logUser.userSex" /> 女
                        </label>
                        <div class="invalid-feedback">{{ errors.userSex }}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="userEmail"> 邮箱</label>
                    <v-field class="form-control" name="userEmail" id="userEmail" type="email"
                        v-model="logUser.userEmail" placeholder="请填写新的邮箱" />
                    <div class="invalid-feedback">{{ errors.userEmail }}</div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" type="submit">修改</button>
                <button class="btn btn-default" ref="regclose" type="button" @click="clear" data-dismiss="modal">
                    取消
                </button>
            </div>
        </v-form>
    </div>
</template>

<script>
import { Form, Field } from "vee-validate";
import * as Yup from "yup";
import { populateFormData, encrypt } from "../utils/util";
export default {
    components: {
        VForm: Form,
        VField: Field,
    },
    data() {
        return {
            logUser: {},
            modiForm: Yup.object().shape({
                userId: Yup.string().required("用户编号不能为空"),
                userName: Yup.string().required("用户名不能为空"),
                oldPass: Yup.string().required("密码不能为空"),
                userPass: Yup.string()
                    .oneOf([Yup.ref("userPass"), null], "两次输入密码不一致")
                    .min(6, "密码长度不能小于6位")
                    .required("确认密码不能为空"),
                userPass1: Yup.string()
                    .oneOf([Yup.ref("userPass"), null], "两次新密码不一致")
                    .required("确认密码不能为空"),
                userAge: Yup.number().required("请输入新的年龄"),
                userSex: Yup.string().required("用户性别不能为空"),
                userEmail: Yup.string()
                    .required("邮箱不能为空")
                    .email("邮箱地址不合法"),
            }),
        }
    },
    methods: {
        update(value) {
            let logonUser = sessionStorage.getItem("logonUser")
            let user = sessionStorage.getItem("user")
            if (logonUser != null) {
                logonUser = JSON.parse(logonUser)
            }
            if (user != null) {
                user = JSON.parse(user)
            }
            let encryptstr = encrypt(value.oldPass, logonUser.key)
            if (logonUser.userPass != encryptstr) {
                this.$refs.oldPass.innerHTML = "原密码不正确"
                return;
            }
            const params = populateFormData(value)
            this.axios.post('user/updateUser', params).then((res) => {
                if (res.data.code == 0) {
                    this.$toast("恭喜您，信息修改成功！")
                } else {
                    this.$toast("对不起，信息修改失败！")
                }
            })
        }
    },
    created() {
        let logUser = sessionStorage.getItem("user")
        if (logUser) {
            this.logUser = JSON.parse(logUser)
        }
    }
}
</script>

<style scoped>
.invalid-feedback {
    color: red;
}

.breadcrumb {
    background-color: red;
    color: white;
}
</style>