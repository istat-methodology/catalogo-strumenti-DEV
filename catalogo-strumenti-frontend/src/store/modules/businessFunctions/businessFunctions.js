import { businessService } from "@/services";
import { businessOpenService } from "@/services";

const state = {
  bFunctionList: [],
  bFunctionToolsList: [],
  bFunction: null
};

const mutations = {
  SET_FUNCTIONLIST(state, bFunctionList) {
    state.bFunctionList = bFunctionList;
  },
  SET_FUNCTIONTOOLSLIST(state, bFunctionToolsList) {
    state.bFunctionToolsList = bFunctionToolsList;
  },
  SET_FUNCTION(state, bFunction) {
    state.bFunction = bFunction;
  }
};

const actions = {
  findAll({ commit }) {
    businessOpenService.findAll().then(
      data => {
        commit("SET_FUNCTIONLIST", data);
      },
      error => {
        console.log(error);
      }
    );
  },
  save({ commit, dispatch }, payload) {
    return businessService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_FUNCTION", data);
        dispatch("message/success", "Business Function salvata!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return businessOpenService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_FUNCTION", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  findBFunctionsByBService({ commit }, id) {
    return businessOpenService
      .findBFunctionsByBService(id)
      .then(data => {
        //console.log(data);
        commit("SET_FUNCTIONTOOLSLIST", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return businessService
      .update(payload)
      .then(data => {
        commit("SET_FUNCTION", data);
        dispatch("message/success", "Business Function aggiornata!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  filter({ commit }, payload) {
    return businessOpenService
      .filter(payload)
      .then(data => {
        commit("SET_FUNCTIONLIST", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return businessService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Business Function eliminata!");
      })
      .catch(err => {
        console.log(err);
      });
  },
  addProcess({ commit, dispatch }, params) {
    return businessService
      .addProcess(params.fID, params.pID)
      .then(data => {
        commit("SET_FUNCTION", data);
        dispatch(
          "message/success",
          "Processo aggiunto alla Business Function!",
          {
            root: true
          }
        );
      })
      .catch(err => {
        console.log(err);
      });
  },
  removeProcess({ commit, dispatch }, params) {
    return businessService
      .removeProcess(params.fID, params.pID)
      .then(data => {
        commit("SET_FUNCTION", data);
        dispatch(
          "message/success",
          "Processo rimosso dalla Business Function!",
          {
            root: true
          }
        );
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  bFunction: state => {
    return state.bFunction;
  },
  bFunctionList: state => {
    return state.bFunctionList;
  },
  bFunctionToolsList: state => {
    return state.bFunctionToolsList;
  }
};

export const bFunction = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
