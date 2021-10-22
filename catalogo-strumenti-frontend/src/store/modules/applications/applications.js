import { applicationsService } from "@/services";

const state = {
  applications: []
};

const mutations = {
  SET_APPLICATIONS(state, applications) {
    state.applications = applications;
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
  applications: state => {
    return state.applications;
  }
};

export const applications = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
