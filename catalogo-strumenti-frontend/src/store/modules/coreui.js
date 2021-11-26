import { Context } from "@/common";

const state = {
  sidebarShow: "responsive",
  sidebarMinimize: false,
  context: "",
  isLoading: false,
  isHome: false,
  isDeskAppList: false,
  isSoftProcList: false,
  isStatServiceList: false,
  isStatMethodList: false
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
      case Context.DeskAppList:
        state.isDeskAppList = true;
        break;
      case Context.SoftProcList:
        state.isSoftProcList = true;
        break;
      case Context.StatServiceList:
        state.isStatServiceList = true;
        break;
      case Context.StatMethodList:
        state.isStatMethodList = true;
        break;
      default:
        break;
    }
  },
  CLEAR_CONTEXT(state) {
    state.context = "";
    state.isHome = false;
    state.isDeskAppList = false;
    state.isSoftProcList = false;
    state.isStatServiceList = false;
    state.isStatMethodList = false;
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
  isDeskAppList: state => {
    return state.isDeskAppList;
  },
  isSoftProcList: state => {
    return state.isSoftProcList;
  },
  isStatServiceList: state => {
    return state.isStatServiceList;
  },
  isStatMethodList: state => {
    return state.isStatMethodList;
  }
};

export const coreui = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
