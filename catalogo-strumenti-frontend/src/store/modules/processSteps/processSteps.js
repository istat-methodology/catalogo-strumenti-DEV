import { processStepsService } from "@/services";
import { processStepsOpenService } from "@/services";

const state = {
  processStepsList: [],
  processSteps: null
};

const mutations = {
  SET_PROCSTEPLIST(state, processStepsList) {
    state.processStepsList = processStepsList;
  },
  SET_PROCSTEP(state, processSteps) {
    state.processSteps = processSteps;
  }
};

const actions = {
  findById({ commit }, id) {
    return processStepsOpenService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_PROCSTEP", data);
      })
      .catch(err => {
        console.log(err);
      });
  },

  findAll({ commit }) {
    processStepsOpenService.findAll().then(
      data => {
        commit("SET_PROCSTEPLIST", data);
      },
      error => {
        console.log(error);
      }
    );
  },

  save({ commit, dispatch }, payload) {
    return processStepsService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_PROCSTEP", data);
        dispatch("message/success", "Process Step salvato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return processStepsService
      .update(payload)
      .then(data => {
        commit("SET_PROCSTEP", data);
        dispatch("message/success", "Process Step aggiornato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return processStepsService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Process Step eliminato!");
      })
      .catch(err => {
        console.log(err);
      });
  },
  removeStep({ commit, dispatch }, params) {
    return processStepsService
      .removeStep(params.idStep, params.idProcess)
      .then(data => {
        commit("SET_PROCSTEP", data);
        dispatch("message/success", "Step Eliminato dal Business Process!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  processSteps: state => {
    return state.processSteps;
  },
  processStepsList: state => {
    return state.processStepsList;
  }
};

export const processSteps = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
