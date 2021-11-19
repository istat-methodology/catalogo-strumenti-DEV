import { proceduresService } from "@/services";

const state = {
  procedures: [],
  procedure: null
};

const mutations = {
  SET_PROCEDURES(state, procedures) {
    state.procedures = procedures;
  },
  SET_PROCEDURE(state, procedure) {
    state.procedure = procedure;
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
  },
  findAll({ commit }) {
    proceduresService.findAll().then(
      data => {
        commit("SET_PROCEDURES", data);
      },
      error => {
        console.log(error);
      }
    );
  },
  save({ commit, dispatch }, payload) {
    return proceduresService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_PROCEDURE", data);
        dispatch("message/success", "Software Procedure saved!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return proceduresService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_PROCEDURE", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return proceduresService
      .update(payload)
      .then(data => {
        commit("SET_PROCEDURE", data);
        dispatch("message/success", "Software Procedure updated!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return proceduresService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Software Procedure deleted!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  procedures: state => {
    return state.procedures;
  },
  procedure: state => {
    return state.procedure;
  }
};

export const procedures = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
