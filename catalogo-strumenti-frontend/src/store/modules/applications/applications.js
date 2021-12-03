import { applicationsService } from "@/services";

const state = {
  applications: [],
  application: null
};

const mutations = {
  SET_APPLICATIONS(state, applications) {
    state.applications = applications;
  },
  SET_APPLICATION(state, application) {
    state.application = application;
  }
};

const actions = {
  findApplications({ commit }, payload) {
    return applicationsService
      .findApplications(payload)
      .then(data => {
        commit("SET_APPLICATIONS", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  findAll({ commit }) {
    applicationsService.findAll().then(
      data => {
        commit("SET_APPLICATIONS", data);
      },
      error => {
        console.log(error);
      }
    );
  },
  save({ commit, dispatch }, payload) {
    return applicationsService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_APPLICATION", data);
        dispatch("message/success", "Applicazione Desktop salvata!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return applicationsService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_APPLICATION", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return applicationsService
      .update(payload)
      .then(data => {
        commit("SET_APPLICATIONS", data);
        dispatch("message/success", "Applicazione Desktop aggiornata!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return applicationsService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Applicazione Desktop eliminata!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  applications: state => {
    return state.applications;
  },
  application: state => {
    return state.application;
  }
};

export const applications = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
