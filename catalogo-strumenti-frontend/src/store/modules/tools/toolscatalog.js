import { toolsService } from "@/services";

const state = {
  toolscatalog: []
};

const mutations = {
  SET_TOOLSCATALOG(state, catalog) {
    state.toolscatalog = catalog;
  }
};

const actions = {
  findAll({ commit }) {
    return toolsService
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
  toolscatalog: state => {
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
