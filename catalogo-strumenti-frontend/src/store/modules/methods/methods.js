import { methodsService } from "@/services";

const state = {
  methods: []
};

const mutations = {
  SET_METHODS(state, methods) {
    state.methods = methods;
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
  }
  /*  save({ commit, dispatch }, formData) {
    return toolsService
      .save(formData)
      .then(data => {
        //console.log(data);
        commit("SET_TOOL", data);
        dispatch("message/success", "Tool saved!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return toolsService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_TOOL", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, formData) {
    return toolsService
      .update(formData)
      .then(data => {
        commit("SET_TOOL", data);
        dispatch("message/success", "Tool saved!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return toolsService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Tool deleted!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  } */
};

const getters = {
  methods: state => {
    return state.methods;
  }
};

export const methods = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
