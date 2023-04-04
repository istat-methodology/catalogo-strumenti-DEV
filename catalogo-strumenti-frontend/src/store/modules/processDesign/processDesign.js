import { processDesignService } from "@/services";

const state = {
  processDesign: null
};

const mutations = {
  SET_PROCESSDESIGN(state, processDesign) {
    state.processDesign = processDesign;
  }
};

const actions = {
  delete({ dispatch }, id) {
    return processDesignService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Process Design eliminato!");
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
  }
};

export const processDesign = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
