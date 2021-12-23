import { toolsService } from "@/services";
import { toolsOpenService } from "@/services";

const state = {
  toolscatalog: [],
  tool: null
};

const mutations = {
  SET_TOOLSCATALOG(state, catalog) {
    state.toolscatalog = catalog;
  },
  SET_TOOL(state, tool) {
    state.tool = tool;
  }
};

const actions = {
  findAll({ commit }) {
    return toolsOpenService
      .findAll()
      .then(data => {
        commit("SET_TOOLSCATALOG", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  save({ commit, dispatch }, payload) {
    return toolsService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_TOOL", data);
        dispatch("message/success", "Strumento Metodologico salvato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return toolsOpenService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_TOOL", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return toolsService
      .update(payload)
      .then(data => {
        commit("SET_TOOL", data);
        dispatch("message/success", "Strumento Metodologico aggiornato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return toolsService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Strumento Metodologico eliminato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  toolscatalog: state => {
    return state.toolscatalog;
  },
  tool: state => {
    return state.tool;
  }
};

export const tools = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
