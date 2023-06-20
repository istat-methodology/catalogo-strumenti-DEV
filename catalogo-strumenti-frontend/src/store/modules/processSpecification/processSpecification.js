import { processSpecificationService } from "@/services";
import { processSpecificationOpenService } from "@/services";

const state = {
  processSpecification: null
};

const mutations = {
  SET_PROCESSSPECIFICATION(state, processSpecification) {
    state.processSpecification = processSpecification;
  },
  SET_PROCESSSPECIFICATION_LIST(state, processSpecificationList) {
    state.processSpecificationList = processSpecificationList;
  }
};

const actions = {
  findAll({ commit }) {
    processSpecificationOpenService.findAll().then(
      data => {
        commit("SET_PROCESSSPECIFICATION_LIST", data);
      },
      error => {
        console.log(error);
      }
    );
  },

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
  },
  processSpecificationList: state => {
    return state.processSpecificationList;
  }
};

export const processSpecification = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
