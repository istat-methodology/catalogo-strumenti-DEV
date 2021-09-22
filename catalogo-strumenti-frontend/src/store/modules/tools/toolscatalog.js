import { toolsService } from "@/services";

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
    return toolsService
      .findAll()
      .then(data => {
        commit("SET_TOOLSCATALOG", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  save({ commit, dispatch }, formData) {
    return toolsService
      .save(formData)
      .then(data => {
        //console.log(data);
        commit("SET_TOOL", data);
        dispatch("message/success", "Tool saved!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return toolsService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_TOOL", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, formData) {
    return toolsService
      .update(formData)
      .then(data => {
        commit("SET_TOOL", data);
        dispatch("message/success", "Tool saved!", {
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
        dispatch("message/success", "Tool deleted!", {
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
