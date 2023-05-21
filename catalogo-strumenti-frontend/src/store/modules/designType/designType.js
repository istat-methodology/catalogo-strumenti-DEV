import {
  designtypeService,
  designtypeopenService,
  designtypebyparentopenService
} from "@/services";

const state = {
  designtype: null,
  designtypeList: {},
  designtypebyparent: null,
  designtypebyparentList: {}  
};

const mutations = {
  SET_DESIGNTYPELIST(state, designtypeList) {
    state.designtypeList = designtypeList;
  },
  SET_DESIGNTYPE(state, designtype) {
    state.designtype = designtype;
  },
  SET_DESIGNTYPEBYPARENTLIST(state, designtypebyparentList) {
    state.designtypebyparentList = designtypebyparentList;
  },
  SET_DESIGNTYPEBYPARENT(state, designtypebyparent) {
    state.designtypebyparent = designtypebyparent;
  }
};
const actions = {
  findAll({ commit }) {
    designtypeopenService.findAll().then(
      data => {
        commit("SET_DESIGNTYPELIST", data);
      },
      error => {
        console.log(error);
      }
    );
  },
  save({ commit, dispatch }, payload) {
    return designtypeService
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
    return designtypeService
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
    return designtypeService
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
    return designtypeopenService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_DESIGNTYPE", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  findByParent({ commit }, parent) {
    return designtypebyparentopenService
      .filter(parent)
      .then(data => {
        //console.log(data);
        commit("SET_DESIGNTYPEBYPARENTLIST", data);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
const getters = {
  designtypeList: state => {
    return state.designtypeList;
  },
  designtype: state => {
    return state.designtype;
  },
  designtypebyparentList: state => {
    return state.designtypebyparentList;
  },
  designtypebyparent: state => {
    return state.designtypebyparent;
  }
};
export const designTypes = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
