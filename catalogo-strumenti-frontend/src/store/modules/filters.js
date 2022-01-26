const state = {
  /* gsbpmParams: [],
  typeParams: [] */
  params: [
    {
      gsbpm: [],
      type: []
    }
  ]
};

const mutations = {
  /* TOGGLE_SIDEBAR_DESKTOP(state) {
    const sidebarOpened = [true, "responsive"].includes(state.sidebarShow);
    state.sidebarShow = sidebarOpened ? false : "responsive";
  },
  TOGGLE_SIDEBAR_MOBILE(state) {
    const sidebarClosed = [false, "responsive"].includes(state.sidebarShow);
    state.sidebarShow = sidebarClosed ? true : "responsive";
  },
  SET_LOADING(state, isLoading) {
    state.isLoading = isLoading;
  }, */
  SET_PARAMS(state, params) {
    state.params.gsbpm = params.gsbpm;
    state.params.type = params.type;
  }
  /* CLEAR_CONTEXT(state) {
    state.context = "";
    state.isHome = false;
    state.isToolList = false;
    state.isToolDetail = false;
    state.isToolEdit = false;
  }, */
  /* set(state, [variable, value]) {
    state[variable] = value;
  } */
};

const actions = {
  /* toggleSidebarDesktop({ commit }) {
    commit("TOGGLE_SIDEBAR_DESKTOP");
  },
  toggleSidebarMobile({ commit }) {
    commit("TOGGLE_SIDEBAR_MOBILE");
  },
  loading({ commit }, isLoading) {
    commit("SET_LOADING", isLoading);
  }, */
  setParams({ commit }, params) {
    commit("SET_PARAMS", params);
  }
  /* setType({ commit }, params) {
    commit("SET_TYPEPARAMS", params);
  } */
  /*  clearContext({ commit }) {
    commit("CLEAR_CONTEXT");
  } */
};

const getters = {
  params: state => {
    return state.params;
  }
  /*  getType: state => {
    return state.typeParams;
  } */
};

export const filter = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
