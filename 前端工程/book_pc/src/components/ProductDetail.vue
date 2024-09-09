<template>
  <form class="form-inline" role="form">
    <div class="goods-detail-inner">
      <div class="goods-imgs">
        <div class="goods-thumbnail">
          <canvas ref="canvas1" id="canvas1"></canvas>
          <canvas id="canvas2" style="display: none; left: 0px; top: 0px"></canvas>
          <label class="sr-only" id="pic">
            prefix({{ product.goodsPic }})</label>
          <label class="sr-only" id="cateId">{{ product.cateId }}}</label>
        </div>

      </div>

      <div class="goods-detail">
        <h1 id="goodsName">{{ product.goodsName }}</h1>
        <div class="detail-item price-content">
          <span class="title"> 价格 </span>
          <div class="price-inner">
            <em>¥ </em>
            <span class="price" id="goodsDiscount">{{
              product.goodsDiscount
            }}</span>
            <s>
              <span class="ori-price" id="goodsPrice">{{
                product.goodsPrice
              }}</span></s>
          </div>
        </div>
        <div class="detail-item">
          <span class="title"> 运费 </span>
          <span> ¥ {{ product.goodsPostalfee }} </span>
        </div>
        <div class="detail-item">
          <span class="title"> 销量 </span>
          <div>共{{ product.goodsSales }}件</div>
        </div>
        <div class="detail-item">
          <span class="title"> 数量</span>
          <div class="input-group input-group-sm col-xs-3">
            <input class="form-control" id="num" v-model="cartItem.num" name="num" min="1" type="number" />
          </div>
        </div>
        <div class="detail-item action">
          <span class="title"> </span>
          <button @click="buy" type="button">立即购买</button>
          <button @click="addCart" type="button">加入购物车</button>
        </div>
      </div>
    </div>
    <div class="details-wrapper">
      <h3>书本详情</h3>
      <div class="detail-item">
        <span>作者：</span>
        <div>{{ product.goodsOrigin }}</div>
      </div>
      <div class="detail-item">
        <span>分类</span>
        <div>{{ product.goodsMaterial }}</div>
      </div>
      <span>详细介绍：</span>
      <div class="desc">
        {{ product.goodsDisc }}
      </div>

    </div>
  </form>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <a ref="msgModal" id="modal-cart" href="#modal-container-cart" role="button" class="btn" data-toggle="modal"
          style="display: none"></a>
        <div class="modal fade" id="modal-container-cart" role="dialog" aria-labelledby="myModalLabel"
          aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">添加成功</h5>
                <button type="button" class="close" data-dismiss="modal">
                  <span aria-hidden="true">×</span>
                </button>
              </div>
              <div class="modal-body">当前商品已添加购物车</div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                  关闭
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: ["product"],
  inject: ["eventBus"],
  data() {
    return {
      cartItem: {
        pic: "",
        num: 1,
      },
      showImage: "",
    };
  },
  updated() {
    if (this.showImage === "" && this.product.pics.length > 0) {
      this.showImage = this.product.pics[0].picUrl;
      this.changePic(this.showImage);
    }
  },
  methods: {
    changePic(image) {
      this.cartItem.pic = image;
      let img = new Image();
      img.src = this.baseURL + image;
      img.onload = () => {
        const cvs = this.$refs.canvas1;
        let ctx = cvs.getContext("2d");
        ctx.clearRect(0, 0, cvs.width, cvs.height);
        ctx.drawImage(img, 0, 0, cvs.width, cvs.height);
      };
    },
    buy() {
      const cartItem = { ...this.product, ...this.cartItem };
      if (!this.$store.getters["user/isLogin"]) {
        this.eventBus.emit("needLogin");
      } else {
        this.$store.dispatch("order/addToBuyNow", {
          cartItem,
          success: () => {
            this.$router.push({
              name: "CheckOut",
              params: { type: "now" },
              props: true,
            });
          },
          fail: (e) => {
            console.log(e);
            this.$toast("添加购物车失败");
          },
        });
      }
    },
    addCart() {
      const cartItem = { ...this.product, ...this.cartItem };
      this.$store.dispatch("order/addToCart", cartItem);
      this.$refs.msgModal.click();
    },
  },
};
</script>
<style scoped>
@charset "UTF-8";

.container-fluid {
  padding-right: 15px !important;
  padding-left: 15px !important;
}

.btn {
  outline: none !important;
}

.goods-detail-wrapper {
  padding: 0;
}

.goods-detail-inner {
  display: flex;
}

.goods-imgs {
  margin-right: 30px;
}

.goods-thumbnails {
  padding: 10px 0;
  display: flex;
}

.goods-thumbnails img {
  width: 60px;
  height: 60px;
  cursor: pointer;
  margin-right: 10px;
}

.goods-detail {
  padding-top: 50px;
  flex: 1;
}

.detail-item {
  line-height: 24px;
  display: flex;
  margin-bottom: 10px;
}

.detail-item span.title {
  display: block;
  width: 120px;
  color: #838383;
  padding-left: 15px;
}

.goods-detail-inner {
  padding: 50px 0;
}

.details-wrapper h3 {
  position: relative;
  padding-left: 20px;
  color: #000;
}

.details-wrapper h3::before {
  position: absolute;
  top: 50%;
  left: 0;
  transform: translateY(-50%);
  content: " ";
  display: inline-block;
  background-color: #333;
  width: 5px;
  height: 22px;
}

.details-wrapper span {
  font-weight: bold;
}

.details-wrapper .desc {
  text-indent: 2em;
  margin-bottom: 30px;
}

.detail-item.action button {
  background-color: #ff0036;
  border: 1px solid #ff0036;
  color: #fff;
  overflow: hidden;
  position: relative;
  width: 178px;
  font-family: "Microsoft Yahei";
  border-radius: 0;
  margin-right: 10px;
  height: 38px;
  line-height: 38px;
  text-align: center;
  font-size: 16px;
  outline: none;
}

.detail-item em {
  font-style: normal;
  font-weight: 400;
  color: #ff0036;
  font-size: 18px;
  font-family: Arial;
}

.detail-item .price {
  font-family: Arial;
  color: #ff0036;
  font-size: 24px;
}

.detail-item.action {
  margin-top: 50px;
}

.ori-price {
  font-size: 16px;
}

.goods-detail h1 {
  padding-bottom: 0.2em;
  line-height: 1;
  font-size: 16px;
  font-weight: 700;
  color: #000;
}

.price-content {
  padding: 10px 0;
  display: flex;
  width: 100%;
  background-color: #e9e9e9;
  background-repeat: no-repeat;
  background-image: url(data:image/png;base64,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);
  background-color: #e9e9e9;
  width: 100%;
}
</style>