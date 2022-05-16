import { businessProcessService } from "@/services";
import { businessProcessOpenService } from "@/services";

const state = {
  procStepList: [],
  procStep: null
};

const mutations = {
  SET_PROCSTEPLIST(state, procStepList) {
    state.procStepList = procStepList;
  },
  SET_PROCSTEP(state, procStep) {
    state.procStep = procStep;
  }
};

const actions = {
  findAll({ commit }) {
    businessProcessOpenService.findAll().then(
      data => {
        commit("SET_PROCSTEPLIST", data);
      },
      error => {
        console.log(error);
      }
    );
  },
  save({ commit, dispatch }, payload) {
    return businessProcessService
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
    return businessProcessOpenService
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
    return businessProcessService
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
  filter({ commit }, payload) {
    return businessProcessOpenService
      .filter(payload)
      .then(data => {
        commit("SET_PROCSTEPLIST", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return businessProcessService
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
  bProcess: state => {
    return state.bProcess;
  },
  bProcessList: state => {
    return state.bProcessList;
  }
};

export const bProcess = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
