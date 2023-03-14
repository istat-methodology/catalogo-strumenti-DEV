import { stepInstanceService } from "@/services"
import { stepInstanceOpenService } from "@/services"

const state = {
  stepinstanceList: [],
  stepinstance: null
}

const mutations = {
  SET_STEPINSTANCELIST(state, stepinstanceList) {
    state.stepinstanceList = stepinstanceList
  },
  SET_STEPINSTANCE(state, stepinstance) {
    state.stepinstance = stepinstance
  }
}

const actions = {
  findAll({ commit }) {
    stepInstanceOpenService.findAll().then(
      (data) => {
        commit("SET_STEPINSTANCELIST", data)
      },
      (error) => {
        console.log(error)
      }
    )
  },
  save({ commit, dispatch }, payload) {
    return stepInstanceService
      .save(payload)
      .then((data) => {
        //console.log(data);
        commit("SET_STEPINSTANCE", data)
        dispatch("message/success", "Funzionalità salvata!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },
  findById({ commit }, id) {
    return stepInstanceOpenService
      .findById(id)
      .then((data) => {
        //console.log(data);
        commit("SET_STEPINSTANCE", data)
      })
      .catch((err) => {
        console.log(err)
      })
  },
  update({ commit, dispatch }, payload) {
    return stepInstanceService
      .update(payload)
      .then((data) => {
        commit("SET_STEPINSTANCE", data)
        dispatch("message/success", "Funzionalità aggiornata!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },
  delete({ dispatch }, id) {
    return stepInstanceService
      .delete(id)
      .then(() => {
        dispatch("findAll")
        dispatch("message/success", "Funzionalità eliminata!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  }
}

const getters = {
  stepinstanceList: (state) => {
    return state.stepinstanceList
  },
  stepinstance: (state) => {
    return state.stepinstance
  }
}

export const stepinstance = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
}
