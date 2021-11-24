import { methodsService } from "@/services";

const state = {
  methods: []
};

const mutations = {
  SET_METHODS(state, methods) {
    state.methods = methods;
  },
  SET_METHOD(state, method) {
    state.method = method;
  }
};

const actions = {
  findMethods({ commit }, payload) {
    return methodsService
      .findMethods(payload)
      .then(data => {
        commit("SET_METHODS", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  findAll({ commit }) {
    methodsService.findAll().then(
      data => {
        commit("SET_METHODS", data);
      },
      error => {
        console.log(error);
      }
    );
  },
  save({ commit, dispatch }, payload) {
    return methodsService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_METHODS", data);
        dispatch("message/success", "Statistical Method saved!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return methodsService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_METHOD", data);
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
        dispatch("message/success", "Statistical Method updated!", {
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
        dispatch("message/success", "Statistical Method deleted!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  methods: state => {
    return state.methods;
  },
  method: state => {
    return state.method;
  }
};

export const methods = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
