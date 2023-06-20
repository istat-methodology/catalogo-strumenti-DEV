import { processDesignService } from "@/services";
import { processDesignOpenService } from "@/services";
import { processDesignByProcessStepOpenService } from "@/services";

const state = {
  processDesign: null,
  processDesignList: [],
  processDesignListByProcessStep: []
};

const mutations = {
  SET_PROCESSDESIGN(state, processDesign) {
    state.processDesign = processDesign;
  },
  SET_PROCESSDESIGN_LIST(state, processDesignList) {
    state.processDesignList = processDesignList;
  },
  SET_PROCESSDESIGN_BY_PROCESSSTEP(state, processDesignListByProcessStep) {
    state.processDesignListByProcessStep = processDesignListByProcessStep;
  }
};

const actions = {
  findById({ commit }, id) {
    return processDesignByProcessStepOpenService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_PROCESSDESIGN_BY_PROCESSSTEP", data);
      })
      .catch(err => {
        console.log(err);
      });
  },

  findAll({ commit }) {
    processDesignOpenService.findAll().then(
      data => {
        commit("SET_PROCESSDESIGN_LIST", data);
      },
      error => {
        console.log(error);
      }
    );
  },
  delete({ dispatch }, id) {
    return processDesignService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Process Design eliminato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return processDesignService
      .update(payload)
      .then(data => {
        commit("SET_PROCESSDESIGN", data);
        dispatch("message/success", "Process Design aggiornato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  save({ commit, dispatch }, payload) {
    return processDesignService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_PROCESSDESIGN", data);
        dispatch("message/success", "Process Design salvato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  processDesign: state => {
    return state.processDesign;
  },
  processDesignList: state => {
    return state.processDesignList;
  },
  processDesignListByProcessStep: state => {
    return state.processDesignListByProcessStep;
  }
};

export const processDesign = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
