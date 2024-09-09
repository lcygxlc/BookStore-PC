import { createApp } from 'vue'
import { prefix } from './utils/util'
import './assets/main.css'
import App from './App.vue'
import router from './router'
import store from './store'

import axios from 'axios'
import VueAxios from 'vue-axios'
import DKToast from 'vue-dk-toast'

axios.defaults.baseURL = 'http://localhost:8888'
axios.defaults.withCredentials = true
axios.defaults.headers['X-Requested-With'] = 'XMLHttpRequest'

const app = createApp(App);
app.config.globalProperties.prefix = prefix
app.config.globalProperties.baseURL = axios.defaults.baseURL
app.use(VueAxios, axios)
app.use(DKToast)
app.use(store)
app.use(router)
app.mount('#app')