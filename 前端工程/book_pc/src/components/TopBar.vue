<template>
  <div class="row">
    <div class="col-md-12 text-right">
      <li id="li1" v-if="!isLogin">
        <ol class="breadcrumb" id="info">
          <li id="li1" style="color: white;">
            <span>您好，欢迎来到久忆小说平台！</span>
          </li>
          <a ref="logonLink" href="#loginFormModal" style="color: white" data-toggle="modal">[登录]</a>&nbsp;&nbsp;<a
            href="#regFormModal" style="color: white" data-toggle="modal">[新用户注册]</a>&nbsp;
        </ol>
      </li>
      <li v-if="isLogin">
        <ol class="breadcrumb" id="info">
          <li id="li1">
            <span> {{ user.userName }} 您好，欢迎来到久忆小说平台！</span>
          </li>
          <li>
            <a href="#cartModal" data-toggle="modal" style="color: white;">购物车
              <span class="badge" id="cartBadge">{{ cartItems.length }}</span></a>
          </li>
          <li>
            <router-link :to="{ name: 'OrderList' }" style="text-decoration: none; color: white;">我的订单
              >&nbsp;</router-link>

          </li>
          <li>
            <router-link :to="{ name: 'mycenter' }"
              style="text-decoration: none; color: white;">个人中心</router-link>&nbsp;
          </li>
          <li><a href="#" @click.prevent="logout" style="color: white;">退出</a></li>
        </ol>
      </li>
    </div>
  </div>

  <div class="modal fade" id="regFormModal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button class="close" aria-hidden="true" type="button" data-dismiss="modal">
            ×
          </button>
          <h4 class="modal-title">新用户注册</h4>
        </div>
        <v-form @submit="reg" :validation-schema="regForm" v-slot="{ errors }" role="form" id="regForm">
          <div class="modal-body">
            <div class="form-group">
              <label for="userName"> 用户名 </label>
              <v-field class="form-control" name="userName" id="userName" type="text" placeholder="请填写用户名" required />
              <span id="checkNameResult"></span>
              <div class="invalid-feedback">{{ errors.userName }}</div>
            </div>
            <div class="form-group">
              <label for="userPass"> 密码 </label>
              <v-field class="form-control" name="userPass" id="userPass" type="password" placeholder="请填写密码"
                required />
              <div class="invalid-feedback">{{ errors.userPass }}</div>
            </div>
            <div class="form-group">
              <label for="userPass1"> 密码确认 </label>
              <v-field class="form-control" id="userPass1" name="userPass1" type="password" placeholder="请确认密码"
                required />
              <div class="invalid-feedback">{{ errors.userPass1 }}</div>
            </div>
            <div class="form-group">
              <label for="userAge"> 年龄</label>
              <v-field class="form-control" name="userAge" id="userAge" type="number" placeholder="请填写年龄" />
              <div class="invalid-feedback">{{ errors.userAge }}</div>
            </div>
            <div class="form-group">
              <label for="userSex"> 性别 </label>
              <div class="radio">
                <label>
                  <v-field type="radio" name="userSex" id="sex1" value="0" checked />
                  男
                </label>
                <label>
                  <v-field type="radio" name="userSex" id="sex2" value="1" /> 女
                </label>
                <div class="invalid-feedback">{{ errors.userSex }}</div>
              </div>
            </div>
            <div class="form-group">
              <label for="userEmail"> 邮箱</label>
              <v-field class="form-control" name="userEmail" id="userEmail" type="email" placeholder="请填写邮箱" />
              <div class="invalid-feedback">{{ errors.userEmail }}</div>
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary" type="submit">注册</button>
            <button class="btn btn-default" ref="regclose" type="button" @click="clear" data-dismiss="modal">
              关闭
            </button>
          </div>
        </v-form>
      </div>
    </div>
  </div>

  <div class="modal fade" id="loginFormModal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button class="close" aria-hidden="true" type="button" data-dismiss="modal">
            ×
          </button>
          <h1 class="modal-title">登录页面</h1>
        </div>
        <v-form @submit="login" :validation-schema="loginForm" v-slot="{ errors }" class="form-signin" id="loginForm"
          method="post">
          <div class="modal-body">
            <h2 class="form-signin-heading">请输入账号信息</h2>
            <label for="userName" class="sr-only">用户名</label>
            <v-field type="type" name="userName" id="userName" class="form-control" placeholder="用户名" required
              autofocus />
            <div class="invalid-feedback">{{ errors.userName }}</div>
            <br />
            <label for="userPass" class="sr-only">密 码</label>
            <v-field type="password" name="userPass" id="userPass" class="form-control" placeholder="密  码" required />
            <div class="invalid-feedback">{{ errors.userPass }}</div>
            <div class="checkbox">
              <label>
                <v-field type="checkbox" name="rem" value="remember-me" />
                记住我
              </label>
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary" type="submit">登录</button>
            <button ref="loginclose" class="btn btn-default" type="button" data-dismiss="modal" @click="clear">
              关闭
            </button>
          </div>
        </v-form>
      </div>
    </div>
  </div>

  <Cart></Cart>
</template>
<script>
/*crypto-js安装：npm install crypto-js --save*/
import tripledes from "crypto-js/tripledes";
import CryptoJS from "crypto-js";
import { Form, Field } from "vee-validate";
import * as Yup from "yup";
import { mapGetters } from "vuex";
import { populateFormData } from "../utils/util";
import Cart from "../components/Cart.vue";


export default {
  inject: ["eventBus"],
  components: {
    VForm: Form,
    VField: Field,
    Cart,
  },
  data() {
    return {
      regForm: Yup.object().shape({
        userName: Yup.string().required("用户名不能为空"),
        userPass: Yup.string().required("密码不能为空"),
        userPass1: Yup.string()
          .oneOf([Yup.ref("userPass"), null], "两次输入密码不一致")
          .required("确认密码不能为空"),
        userAge: Yup.number().required("请输入年龄"),
        userSex: Yup.string().required("用户性别不能为空"),
        userEmail: Yup.string()
          .required("邮箱不能为空")
          .email("邮箱地址不合法"),
      }),
      loginForm: Yup.object().shape({
        userName: Yup.string().required("用户名必须填写"),
        userPass: Yup.string().required("密码必须填写"),
        rem: Yup.string(),
      }),
    };
  },
  computed: {
    ...mapGetters({
      isLogin: "user/isLogin",
      user: "user/user",
      cartItems: "order/cartItems",
    }),
  },
  methods: {
    clear() {
      this.userForm = {}
    },
    login(form) {
      this.$store.dispatch("user/login", {
        user: form,
        success: () => {
          this.$refs.loginclose.click();
          this.$toast("恭喜登录成功");
        },
        fail: () => {
          this.$toast("用户名/密码错误");
        },
      });
    },
    reg(values) {
      const params = populateFormData(values);
      this.axios.post("/user/reg", params).then((resp) => {
        if (resp.data.reg === "yes") {
          this.$toast("恭喜注册成功");
          this.$refs.regclose.click();
        } else {
          this.$toast("注册失败");
        }
      });
    },
    logout() {
      this.$store.dispatch("user/logout");
      this.$router.push({
        name: "Home",
      });
      this.$toast("退出成功，欢迎再来！");
    },

  },
  created() {
    this.eventBus.on("needLogin", () => {
      this.$refs.logonLink.click()
    })
    if (!this.isLogin) {
      let user = localStorage.getItem("user");
      if (user) {
        user = JSON.parse(user);
        user.userPass = tripledes
          .decrypt(user.userPass, "123456")
          .toString(CryptoJS.enc.Utf8);
        this.$store.dispatch("user/login", user);
      }
    }
  },
};
</script>
<style scoped>
.invalid-feedback {
  color: red;
}

.breadcrumb {
  background-image: linear-gradient(to right, #f2e9ea 0%, #b0cfff 99%);
  color: white;
}
</style>
