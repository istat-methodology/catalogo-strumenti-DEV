import { appsService } from "@/services"
import { appsOpenService } from "@/services"

const state = {
  appserviceList: [],
  appservice: null
}

const mutations = {
  SET_APPSERVICELIST(state, appserviceList) {
    state.appserviceList = appserviceList
  },
  SET_APPSERVICE(state, appservice) {
    state.appservice = appservice
  }
}

const actions = {
  findAll({ commit }) {
    appsOpenService.findAll().then(
      (data) => {
        commit("SET_APPSERVICELIST", data)
      },
      (error) => {
        console.log(error)
      }
    )
  },
  save({ commit, dispatch }, payload) {
    return appsService
      .save(payload)
      .then((data) => {
        //console.log(data);
        commit("SET_APPSERVICE", data)
        dispatch("message/success", "Implementazione salvata!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },
  findById({ commit }, id) {
    return appsOpenService
      .findById(id)
      .then((data) => {
        //console.log(data);
        commit("SET_APPSERVICE", data)
      })
      .catch((err) => {
        console.log(err)
      })
  },
  update({ commit, dispatch }, payload) {
    return appsService
      .update(payload)
      .then((data) => {
        commit("SET_APPSERVICE", data)
        dispatch("message/success", "Implementazione aggiornata!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },
  delete({ dispatch }, id) {
    return appsService
      .delete(id)
      .then(() => {
        dispatch("findAll")
        dispatch("message/success", "Implementazione eliminata!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  }
}

const getters = {
  appserviceList: (state) => {
    return state.appserviceList
  },
  appservice: (state) => {
    return state.appservice
  }
}

export const appservice = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
}
