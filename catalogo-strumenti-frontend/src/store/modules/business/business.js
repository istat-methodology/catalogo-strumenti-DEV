import { businessService } from "@/services";
import { businessOpenService } from "@/services";

const state = {
  businessList: [],
  business: null
};

const mutations = {
  SET_BUSINESSLIST(state, businessList) {
    state.businessList = businessList;
  },
  SET_BUSINESS(state, business) {
    state.business = business;
  }
};

const actions = {
  findAll({ commit }) {
    businessOpenService.findAll().then(
      data => {
        commit("SET_BUSINESSLIST", data);
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
        commit("SET_BUSINESS", data);
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
        commit("SET_BUSINESS", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return businessService
      .update(payload)
      .then(data => {
        commit("SET_BUSINESS", data);
        dispatch("message/success", "Business Function aggiornata!", {
          root: true
        });
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
        dispatch("message/success", "Business Function eliminata!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  businessList: state => {
    return state.businessList;
  },
  business: state => {
    return state.business;
  }
};

export const business = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};