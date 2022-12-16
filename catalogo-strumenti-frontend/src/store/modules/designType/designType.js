import { designTypeService } from "@/services";
const state = {
  designtypeList: [],
  designtype: null,
};
const mutations = {
  SET_DESIGNTYPE_LIST(state, designtypeList) {
    state.designtypeList = designtypeList;
  },
  SET_DESIGNTYPE(state, designtype) {
    state.designtype = designtype;
  },
};
const actions = {
  findAll({ commit }) {
    designTypeService.findAll().then(
      data => {
        commit("SET_DESIGNTYPE_LIST", data);
      },
      error => {
        console.log(error);
      }
    );
  },
  save({ commit, dispatch }, payload) {
    return designTypeService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_DESIGNTYPE", data);
        dispatch("message/success", "DesignType salvato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },  
  update({ commit, dispatch }, payload) {
    return designTypeService
      .update(payload)
      .then(data => {
        commit("SET_DESIGNTYPE", data);
        dispatch("message/success", "DesignType aggiornato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return designTypeService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "DesignType eliminato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return designTypeService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_DESIGNTYPE_LIST", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
};
const getters = {
  designtypeList: state => {
    return state.designtypeList;
  },
  designtype: state => {
    return state.designtype;
  },  
};
export const designtypes = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
