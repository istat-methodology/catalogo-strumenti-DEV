import { servicesService } from "@/services";

const state = {
  services: []
};

const mutations = {
  SET_SERVICES(state, services) {
    state.services = services;
  }
};

const actions = {
  findServices({ commit }, payload) {
    return servicesService
      .findServices(payload)
      .then(data => {
        commit("SET_SERVICES", data);
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
  services: state => {
    return state.services;
  }
};

export const services = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
