import { servicesService } from "@/services";

const state = {
  services: [],
  service: null
};

const mutations = {
  SET_SERVICES(state, services) {
    state.services = services;
  },
  SET_SERVICE(state, service) {
    state.service = service;
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
  },
  findAll({ commit }) {
    servicesService.findAll().then(
      data => {
        commit("SET_SERVICES", data);
      },
      error => {
        console.log(error);
      }
    );
  },
  save({ commit, dispatch }, payload) {
    return servicesService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_SERVICE", data);
        dispatch("message/success", "Statistical Service saved!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return servicesService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_SERVICE", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return servicesService
      .update(payload)
      .then(data => {
        commit("SET_SERVICE", data);
        dispatch("message/success", "Statistical Service updated!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return servicesService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Statistical Service deleted!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  services: state => {
    return state.services;
  },
  service: state => {
    return state.service;
  }
};

export const services = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
