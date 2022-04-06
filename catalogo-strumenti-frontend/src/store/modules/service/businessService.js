import { businessServiceService } from "@/services";
import { businessOpenServiceService } from "@/services";

const state = {
  businessServiceList: [],
  businessService: null
};

const mutations = {
  SET_BUSINESS_SERVICE_LIST(state, businessServiceList) {
    state.businessServiceList = businessServiceList;
  },
  SET_BUSINESS_SERVICE(state, businessService) {
    state.businessService = businessService;
  }
};

const actions = {
  findAll({ commit }) {
    businessOpenServiceService.findAll().then(
      data => {
        commit("SET_BUSINESS_SERVICE_LIST", data);
      },
      error => {
        console.log(error);
      }
    );
  },
  save({ commit, dispatch }, payload) {
    return businessServiceService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_BUSINESS_SERVICE", data);
        dispatch("message/success", "Business Function salvata!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return businessOpenServiceService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_BUSINESS_SERVICE", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return businessServiceService
      .update(payload)
      .then(data => {
        commit("SET_BUSINESS_SERVICE", data);
        dispatch("message/success", "Business Function aggiornata!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return businessServiceService
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
  businessServiceList: state => {
    return state.businessServiceList;
  },
  businessService: state => {
    return state.businessService;
  }
};

export const businessService = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
