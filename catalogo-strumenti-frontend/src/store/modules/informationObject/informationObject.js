import { informationObjectService } from "@/services";
//import { informationObjecOpenService } from "@/services";



const state = {
  informationObject: null,
  informationObjectList: null
};
const mutations = {
  SET_INFORMATIONOBJECT(state, informationObject) {
    state.informationObject = informationObject;
  },
  SET_INFORMATIONOBJECT_LIST(state, informationObjectList) {
    state.informationObjectList = informationObjectList;
  }
};

const actions = {
  delete({ dispatch }, id) {
    return informationObjectService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Information Object eliminato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return informationObjectService
      .update(payload)
      .then(data => {
        commit("SET_INFORMATIONOBJECT", data);
        dispatch("message/success", "Information Object aggiornato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  save({ commit, dispatch }, payload) {
    return informationObjectService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_INFORMATIONOBJECT", data);
        commit("SET_INFORMATIONOBJECT_LIST", data);
        dispatch("message/success", "Information Object  salvato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  informationObject: state => {
    return state.informationObject;
  },
  informationObjectList: state => {
    return state.informationObjectList;
  }
};

export const informationObjects = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
