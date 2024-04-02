import { createStore } from "vuex";
import createPersistedState from 'vuex-persistedstate';

export default createStore({
    state() {
        return {
            paymethod: "",   //결제방식
            userVo:{
                point: "",
                hp: ""    
            },
            savePoint: ""
        };
    },

    //Vuex의 상태메소드
    mutations: {
        setPay(state, pay){
            state.paymethod = pay
        },
        setUserVo(state, UserVo){
            state.userVo = UserVo
        },
        setSavePoint(state, savePoint){
            state.savePoint = savePoint
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
