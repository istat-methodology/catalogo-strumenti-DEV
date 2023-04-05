import { processStepsService } from "@/services";
import { processStepsOpenService } from "@/services";

const state = {
  procStepsList: [],
  procSteps: null
};

const mutations = {
  SET_PROCSTEPLIST(state, procStepsList) {
    state.procStepsList = procStepsList;
  },
  SET_PROCSTEP(state, procSteps) {
    state.procSteps = procSteps;
  }
};

const actions = {
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
  addToBFunction(payload) {
    return processStepsService
      .addToBFunction(payload)
      .then(data => {
        /*  commit("SET_PROCSTEP", data); */
        console.log(data);
        /* dispatch("message/success", "Process Step aggiornato!", {
          root: true
        }); */
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
  }
};

const getters = {
  procSteps: state => {
    return state.procSteps;
  },
  procStepsList: state => {
    return state.procStepsList;
  }
};

export const procSteps = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
