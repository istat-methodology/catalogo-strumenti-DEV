import { businessProcessService } from "@/services";
import { businessProcessOpenService } from "@/services";

const state = {
  bProcessList: [],
  bProcess: {}
};

const mutations = {
  SET_PROCESSLIST(state, bProcessList) {
    state.bProcessList = bProcessList;
  },
  SET_PROCESS(state, bProcess) {
    state.bProcess = bProcess;
  }
};

const actions = {
  findAll({ commit }) {
    businessProcessOpenService.findAll().then(
      data => {
        commit("SET_PROCESSLIST", data);
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
        commit("SET_PROCESS", data);
        dispatch("message/success", "Business Process salvato!", {
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
        commit("SET_PROCESS", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return businessProcessService
      .update(payload)
      .then(data => {
        commit("SET_PROCESS", data);
        dispatch("message/success", "Business Process aggiornato!", {
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
        commit("SET_PROCESSLIST", data);
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
        dispatch("message/success", "Business Process eliminato!");
      })
      .catch(err => {
        console.log(err);
      });
  },
  addStep({ commit, dispatch }, params) {
    return businessProcessService
      .addStep(params.idProcess, params.idStep)
      .then(data => {
        commit("SET_PROCESS", data);
        dispatch("message/success", "Step inserito nel Business Process!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  removeStep({ commit, dispatch }, params) {
    return businessProcessService
      .removeStep(params.idProcess, params.idStep)
      .then(data => {
        commit("SET_PROCESS", data);
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
