import { Context } from "@/common";

const state = {
  sidebarShow: "responsive",
  sidebarMinimize: false,
  context: "",
  isLoading: false,
  isHome: false,
  isToolList: false,
  isToolEdit: false,
  isMethodsList: false
};

const mutations = {
  TOGGLE_SIDEBAR_DESKTOP(state) {
    const sidebarOpened = [true, "responsive"].includes(state.sidebarShow);
    state.sidebarShow = sidebarOpened ? false : "responsive";
  },
  TOGGLE_SIDEBAR_MOBILE(state) {
    const sidebarClosed = [false, "responsive"].includes(state.sidebarShow);
    state.sidebarShow = sidebarClosed ? true : "responsive";
  },
  SET_LOADING(state, isLoading) {
    state.isLoading = isLoading;
  },
  SET_CONTEXT(state, context) {
    state.context = parseInt(context);
    switch (parseInt(context)) {
      case Context.Home:
        state.isHome = true;
        break;
      case Context.ToolList:
        state.isToolList = true;
        break;
      case Context.ToolDetail:
        state.isToolDetail = true;
        break;
      case Context.ToolEdit:
        state.isToolEdit = true;
        break;
      case Context.MethodList:
        state.isMethodsList = true;
        break;
      default:
        break;
    }
  },
  CLEAR_CONTEXT(state) {
    state.context = "";
    state.isHome = false;
    state.isToolList = false;
    state.isToolDetail = false;
    state.isToolEdit = false;
    state.isMethodsList = false;
  },
  set(state, [variable, value]) {
    state[variable] = value;
  }
};

const actions = {
  toggleSidebarDesktop({ commit }) {
    commit("TOGGLE_SIDEBAR_DESKTOP");
  },
  toggleSidebarMobile({ commit }) {
    commit("TOGGLE_SIDEBAR_MOBILE");
  },
  loading({ commit }, isLoading) {
    commit("SET_LOADING", isLoading);
  },
  setContext({ commit }, context) {
    commit("CLEAR_CONTEXT");
    commit("SET_CONTEXT", context);
  },
  clearContext({ commit }) {
    commit("CLEAR_CONTEXT");
  }
};

const getters = {
  sidebarShow: state => {
    return state.sidebarShow;
  },
  sidebarMinimize: state => {
    return state.sidebarMinimize;
  },
  context: state => {
    return state.context;
  },
  isLoading: state => {
    return state.isLoading;
  },
  isHome: state => {
    return state.isHome;
  },
  isToolList: state => {
    return state.isToolList;
  },
  isToolDetail: state => {
    return state.isToolDetail;
  },
  isToolEdit: state => {
    return state.isToolEdit;
  },
  isMethodsList: state => {
    return state.isMethodsList;
  }
};

export const coreui = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
