import { axios } from '../../utils/axios'
export default {
    fetchCates({ commit }) {
        axios.get("/cate/getAllCates").then((res) => {
            commit('saveCates', res.data.cates);
        })
    }
}