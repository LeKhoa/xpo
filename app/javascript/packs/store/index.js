import { createStore } from "vuex" 

const store = createStore({
  state: {
    currentUser: null,
  },

  getters: {
    getCurrentUser(state) {
      return state.currentUser;
    },
  },

  mutations: {
    SET_CURRENT_USER(state, data) {
      state.currentUser = data;
    },
  },

  actions: {
    setCurrentUser({ commit }, currentUser) {
      commit("SET_CURRENT_USER", currentUser);
    },
  }
})

export default store