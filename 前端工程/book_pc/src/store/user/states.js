let user=sessionStorage.getItem('user');
let isLogin=false;
if(user){
    user=JSON.parse(user);
    isLogin=true;
}else{
    user=null;
}

export default {
    isLogin:isLogin,
    user:user,
    addresses:[]
}