import state from "./states.js"
import getters from "./getters.js";
import mutations from "./mutations.js";
import actions from "./actions.js";
export default {
    namespaced: true,
    state() {
        return {
            ...state
        }
    },
    getters: {
        ...getters
    },
    mutations: {
        ...mutations
    },
    actions: {
        ...actions
    }
};