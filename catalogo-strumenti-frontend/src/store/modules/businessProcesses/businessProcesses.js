import { businessProcessService } from "@/services"
import { businessProcessOpenService } from "@/services"

const state = {
  bProcessList: [],
  bProcess: null
}

const mutations = {
  SET_BPROCESSLIST(state, bProcessList) {
    state.bProcessList = bProcessList
  },
  SET_BPROCESS(state, bProcess) {
    state.bProcess = bProcess
  }
}

const actions = {
  findAll({ commit }) {
    businessProcessOpenService.findAll().then(
      (data) => {
        commit("SET_BPROCESSLIST", data)
      },
      (error) => {
        console.log(error)
      }
    )
  },
  save({ commit, dispatch }, payload) {
    return businessProcessService
      .save(payload)
      .then((data) => {
        //console.log(data);
        commit("SET_BPROCESS", data)
        dispatch("message/success", "Business Process salvato!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },
  findById({ commit }, id) {
    return businessProcessOpenService
      .findById(id)
      .then((data) => {
        //console.log(data);
        commit("SET_BPROCESS", data)
      })
      .catch((err) => {
        console.log(err)
      })
  },
  update({ commit, dispatch }, payload) {
    return businessProcessService
      .update(payload)
      .then((data) => {
        commit("SET_BPROCESS", data)
        dispatch("message/success", "Business Process aggiornato!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },
  filter({ commit }, payload) {
    return businessProcessOpenService
      .filter(payload)
      .then((data) => {
        commit("SET_BPROCESSLIST", data)
      })
      .catch((err) => {
        console.log(err)
      })
  },
  delete({ dispatch }, id) {
    return businessProcessService
      .delete(id)
      .then(() => {
        dispatch("findAll")
        dispatch("message/success", "Business Process eliminato!")
      })
      .catch((err) => {
        console.log(err)
      })
  }
}

const getters = {
  bProcess: (state) => {
    return state.bProcess
  },
  bProcessList: (state) => {
    return state.bProcessList
  }
}

export const bProcess = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
}
