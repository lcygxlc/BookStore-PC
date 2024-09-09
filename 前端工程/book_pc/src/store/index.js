import { createStore } from 'vuex'

import user from './user/index'
import cate from './cate/index'
import order from './order/index'

export default createStore({
    modules: {
        user,
        cate,
        order
    }
})