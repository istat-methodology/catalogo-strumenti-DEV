import { documentationTypeService } from "@/services";
import { documentationTypeOpenService } from "@/services";

const state = {
  documentationTypeList: [],
  documentationType: null
};

const mutations = {
  SET_DOCUMENTATIONTYPELIST(state, documentationTypeList) {
    state.documentationTypeList = documentationTypeList;
  },
  SET_DOCUMENTATIONTYPE(state, documentationType) {
    state.documentationType = documentationType;
  }
};

const actions = {
  findAll({ commit }) {
    documentationTypeOpenService.findAll().then(
      data => {
        commit("SET_DOCUMENTATIONTYPELIST", data);
      },
      error => {
        console.log(error);
      }
    );
  },
  save({ commit, dispatch }, payload) {
    return documentationTypeService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_DOCUMENTATIONTYPE", data);
        dispatch("message/success", "Tipo di Documentazione salvata!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return documentationTypeOpenService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_DOCUMENTATIONTYPE", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return documentationTypeService
      .update(payload)
      .then(data => {
        commit("SET_DOCUMENTATIONTYPE", data);
        dispatch("message/success", "Tipo di Documentazione aggiornata!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return documentationTypeService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Tipo di Documentazione eliminata!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  documentationTypeList: state => {
    return state.documentationTypeList;
  },
  documentationType: state => {
    return state.documentationType;
  }
};

export const documentationType = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
