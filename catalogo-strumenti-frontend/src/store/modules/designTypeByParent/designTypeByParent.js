import { designTypeByParentService } from "@/services";
const state = {
  designtypebyparentList:[],
  designtypebyparent: null
};
const mutations = {
  SET_DESIGNTYPE_BYPARENT_LIST(state, designtypebyparentList) {
    state.designtypebyparentList = designtypebyparentList;
  },
  SET_DESIGNTYPE_BYPARENT(state, designtypebyparent) {
    state.designtypebyparent = designtypebyparent;
  }
};
const actions = {
  findByParent({ commit }, parent) {
    return designTypeByParentService
      .filter(parent)
      .then(data => {
        //console.log(data);
        commit("SET_DESIGNTYPE_BYPARENT_LIST", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
};
const getters = {
  designtypebyparentList: state => {
    return state.designtypebyparentList;
  },
  designtypebyparent: state => {
    return state.designtypebyparent;
  },  
};
export const designtypesbyparent = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
