import { createStore } from "vuex";
import createPersistedState from 'vuex-persistedstate';

export default createStore({
    state() {
        return {
            paymethod: ""   //결제방식
        };
    },

    //Vuex의 상태메소드
    mutations: {
        setPay(state, pay){
            state.paymethod = pay
        }
    },
    //vuex-persistedstate
    //세션유지
    plugins: [
        createPersistedState({
            paths: []
        })
    ]
});
