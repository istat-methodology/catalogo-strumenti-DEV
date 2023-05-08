import { methodsService } from "@/services";
import { methodsOpenService } from "@/services";

const state = {
  statisticalMethodsList: [],
  statisticalMethod: null,
  methodsByDocumentation: []
};

const mutations = {
  SET_METHODSLIST(state, statisticalMethodsList) {
    state.statisticalMethodsList = statisticalMethodsList;
  },
  SET_METHOD(state, statisticalMethod) {
    state.statisticalMethod = statisticalMethod;
  },
  SET_METHODSBYDOCUMENTATION(state, methodsByDocumentation) {
    state.methodsByDocumentation = methodsByDocumentation;
  }
};

const actions = {
  findAll({ commit }) {
    return methodsOpenService
      .findAll()
      .then(data => {
        commit("SET_METHODSLIST", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  filter({ commit }, payload) {
    return methodsOpenService
      .filter(payload)
      .then(data => {
        commit("SET_METHODSLIST", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  save({ commit, dispatch }, payload) {
    return methodsService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_METHOD", data);
        dispatch("message/success", "Metodo Statistico salvato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return methodsOpenService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_METHOD", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  findMethodsByDocumentation({ commit }, id) {
    return methodsOpenService
      .findMethodsByDocumentation(id)
      .then(data => {
        commit("SET_METHODSBYDOCUMENTATION", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return methodsService
      .update(payload)
      .then(data => {
        commit("SET_METHOD", data);
        dispatch("message/success", "Metodo statistico aggiornato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  addDocumentation({ commit, dispatch }, params) {
    return methodsService
      .addDocumentation(params.id, params.docID)
      .then(data => {
        commit("SET_METHOD", data);
        dispatch("message/success", "Strumento Metodologico aggiornato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  removeDocumentation({ commit, dispatch }, params) {
    return methodsService
      .removeDocumentation(params.id, params.docID)
      .then(data => {
        commit("SET_METHOD", data);
        dispatch("message/success", "Strumento Metodologico aggiornato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return methodsService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Metodo statistico eliminato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  statisticalMethodsList: state => {
    return state.statisticalMethodsList;
  },
  statisticalMethod: state => {
    return state.statisticalMethod;
  },
  methodsByDocumentation: state => {
    return state.methodsByDocumentation;
  }
};

export const methods = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
