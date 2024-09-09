//引入vue-router、html5历史模式
import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Search from '../views/Search.vue'
import CateView from '../views/CateView.vue';
import GoodsDetailView from '../views/GoodsDetailView.vue'
import CheckOut from '../views/CheckOutView.vue'
import OrderDetail from '../views/OrderDetailView.vue'
import OrderList from '../views/OrderListView.vue'
import Pay from '../views/PayView.vue';
import MyCenter from '../views/MyCenter.vue';
import MyInfo from '../views/MyInfo.vue';
import MyAddress from '../views/MyAddress.vue'



const routes = [
    {
        path: '/',
        name: 'Home',
        component: Home,
    },
    {
        path: '/search/:keyword',
        name: 'search',
        component: Search,
    },
    {
        path: '/cate/:cateId',
        name: 'CateView',
        component: CateView,
    },
    {
        path: '/goods/:goodsId',
        name: 'GoodsDetail',
        component: GoodsDetailView,
    },
    {
        path: '/order/:type',
        name: 'CheckOut',
        component: CheckOut
    },
    {
        path: '/order/:orderId',
        name: 'OrderDetail',
        component: OrderDetail
    },
    {
        path: '/myorder',
        name: 'OrderList',
        component: OrderList
    },
    {
        path: '/pay',
        name: 'Pay',
        component: Pay
    },
    {
        path: '/mycenter',
        name: 'mycenter',
        component: MyCenter,
        children: [
            {
                path: 'myinfo',
                name: 'myinfo',
                component: MyInfo
            },
            {
                path: 'myaddress',
                name: 'myaddress',
                component: MyAddress
            }
        ]
    }
];
//创建 HTML5 模式，不显示hash模式下#内容
const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
    scrollBehavior() {
        // 始终滑动到顶部
        return { top: 0 }
    }
})
//后置路由守卫，修改页面标题
export default router