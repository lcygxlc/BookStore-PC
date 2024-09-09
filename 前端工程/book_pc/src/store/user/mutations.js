export default {
    login(state, payload) {
        state.isLogin = true;
        state.user = payload;
    },
    logout(state) {
        state.isLogin = false;
        state.user = null;
    },
    saveAddresses(state, payload) {
        state.addresses = payload
    },
    addOrUpdateAddress(state, payload) {
        if (payload.addrId === 0 ||
            payload.addrId === undefined ||
            payload.addrId == null) {
            state.addresses.push(payload)
        } else {
            const idx = state.addresses.findIndex(
                (ele) => { return ele.addrId == payload.addrId });
            if (idx >= 0) {
                state.addresses.splice(idx, 1, payload);
            } else {
                state.addresses.push(payload);
            }
        }
    },
    removeAddressById(state, payload) {
        const idx = state.addresses.findIndex(
            (ele) => { return ele.addrId == payload.addrId });
        if (idx >= 0) {
            state.addresses.splice(idx, 1);
        }

    }
}