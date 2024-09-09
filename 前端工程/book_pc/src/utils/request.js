import axios from 'axios'
const request = axios.create({
    timeout: 5000
})

//定义了两个函数：一个用于成功处理请求（当请求被成功拦截时调用），另一个用于错误处理（当请求拦截过程中发生错误时调用）。
// request 拦截器。
// 可以自请求发送前对请求做一些处理
request.interceptors.request.use(config => { //在发送HTTP请求之前设置请求头的Content-Type为JSON格式
    config.headers['Content-Type'] = 'application/json;charset=utf-8';
    config.headers['token'] = localStorage.getItem('token');
    return config
}, error => {   
    return Promise.reject(error)
});

// response 拦截器
// 可以在接口响应后统一处理结果
request.interceptors.response.use(
    response => {
        let res = response.data;
        return res;
    },
    error => {
        console.log('err' + error)
        return Promise.reject(error)
    }
)
export default request
