import { proceduresService } from "@/services";

const state = {
  proceures: []
};

const mutations = {
  SET_PROCEDURES(state, procedures) {
    state.procedures = procedures;
  }
};

const actions = {
  findProcedures({ commit }, payload) {
    return proceduresService
      .findProcedures(payload)
      .then(data => {
        commit("SET_PROCEDURES", data);
      })
      .catch(err => {
        console.log(err);
      });
  }
  /*  save({ commit, dispatch }, formData) {
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
  } */
};

const getters = {
  procedures: state => {
    return state.procedures;
  }
};

export const procedures = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
