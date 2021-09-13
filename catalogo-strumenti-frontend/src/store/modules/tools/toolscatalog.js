import { pivotReportService } from "@/services";

const state = {
  toolscatalog: null
};

const mutations = {
  SET_TOOLSCATALOG(state, catalog) {
    state.toolscatalog = catalog;
  }
};

const actions = {
  findAll({ commit }) {
    return pivotReportService
      .findAll()
      .then(data => {
        commit("SET_TOOLSCATALOG", data);
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  reports: state => {
    return state.toolscatalog;
  }
};

export const tools = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
