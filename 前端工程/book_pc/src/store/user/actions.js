import { axios } from '../../utils/axios'
import { populateFormData, encrypt } from '../../utils/util'
export default {
    login({ commit }, payload) {
        const params = populateFormData(payload.user);
        axios.post("/user/login", params).then((res) => {
            if (res.data.login === 'yes') {
                let user = { userName: payload.user.userName }
                user.key = Math.floor(Math.random() * 1000000)
                user.userPass = encrypt(payload.user.userPass, user.key)
                if (payload.user.rem) {
                    localStorage.setItem('user', JSON.stringify(user))
                }
                sessionStorage.setItem('user', JSON.stringify(res.data.user));
                sessionStorage.setItem("logonUser", JSON.stringify(user));
                commit('login', res.data.user);
                payload.success()
            } else {
                payload.fail()
            }
        })
    },
    logout({ commit }) {
        axios.post("/user/logout").
        then(res => {
            if (res.data.logout === 'yes') {
                localStorage.removeItem('user')
                sessionStorage.removeItem('user')
                sessionStorage.removeItem('logonUser')
                commit('logout')
            }
        })
    },
    fetchUserAddress({ commit }) {
        axios.get("/address/getMyAddress").
        then(res => {
            commit('saveAddresses', res.data.addrs)
        })
    },
    createOrUpdateAddress({ commit }, payload) {
        const params = populateFormData(payload.address);
        axios.post("/address/handleAddress", params).then((res) => {
            if (res.data.code === 0) {
                if (!payload.address.addrId) {
                    payload.address.addrId = res.data.addrId;
                }
                commit('addOrUpdateAddress', payload.address);
                payload.success()
            } else {
                payload.fail()
            }
        })
    },
    removeAddress({ commit }, payload) {
        const params = new URLSearchParams();
        params.append('addrId', payload.address.addrId)
        console.log(payload)
        axios.post("/address/delAddress", params).then((res) => {
            if (res.data.code === 0) {
                commit('removeAddressById', payload.address);
                payload.success()
            } else {
                payload.fail()
            }
        })
    },
    addOrUpdateAddress({ commit }, payload) {
        const params = populateFormData(payload.address);
        axios.post("/address/handleAddress", params).then((res) => {
            if (res.data.code === 0) {
                if (!payload.address.addrId) {
                    payload.address.addrId = res.data.addrId;
                }
                commit('addOrUpdateAddress', payload.address);
                payload.success()
            } else {
                payload.fail()
            }
        })
    },
    setDefaultAddress(context, payload) {
        const params = new URLSearchParams();
        params.append('addrId', payload.address.addrId)
        axios.post("/address/setDefaultAddress", params).then((res) => {
            if (res.data.code === 0) {
                payload.success()
            } else {
                payload.fail()
            }
        })
    }
}