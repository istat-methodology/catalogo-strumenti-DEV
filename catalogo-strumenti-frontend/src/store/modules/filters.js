const state = {
  params: [
    {
      gsbpm: [],
      type: []
    }
  ]
};

const mutations = {
  SET_PARAMS(state, params) {
    state.params.gsbpm = params.gsbpm;
    state.params.type = params.type;
  },
  RESET_FILTERS(state) {
    state.params.gsbpm = [];
    state.params.type = [];
  }
};

const actions = {
  setParams({ commit }, params) {
    commit("SET_PARAMS", params);
  },
  resetFilters({ commit }) {
    commit("RESET_FILTERS");
  }
};

const getters = {
  params: state => {
    return state.params;
  }
};

export const filter = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
