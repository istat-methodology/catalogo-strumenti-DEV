import { processSpecificationService } from "@/services";

const state = {
  processSpecification: null
};

const mutations = {
  SET_PROCESSSPECIFICATION(state, processSpecification) {
    state.processSpecification = processSpecification;
  }
};

const actions = {
  delete({ dispatch }, id) {
    return processSpecificationService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Process Specification eliminato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return processSpecificationService
      .update(payload)
      .then(data => {
        commit("SET_PROCESSSPECIFICATION", data);
        dispatch("message/success", "Process Specification aggiornato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  save({ commit, dispatch }, payload) {
    return processSpecificationService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_PROCESSSPECIFICATION", data);
        dispatch("message/success", "Process Specification salvato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  processSpecification: state => {
    return state.processSpecification;
  }
};

export const processSpecification = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
