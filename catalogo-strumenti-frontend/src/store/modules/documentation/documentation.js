import { documentationService } from "@/services"
import { documentationOpenService } from "@/services"

const state = {
  documentationList: [],
  documentation: null
}

const mutations = {
  SET_DOCUMENTATIONLIST(state, documentationList) {
    state.documentationList = documentationList
  },
  SET_DOCUMENTATION(state, documentation) {
    state.documentation = documentation
  }
}

const actions = {
  findAll({ commit }) {
    documentationOpenService.findAll().then(
      (data) => {
        commit("SET_DOCUMENTATIONLIST", data)
      },
      (error) => {
        console.log(error)
      }
    )
  },
  save({ commit, dispatch }, payload) {
    return documentationService
      .save(payload)
      .then((data) => {
        //console.log(data);
        commit("SET_DOCUMENTATION", data)
        dispatch("message/success", "Documentazione salvata!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },
  findById({ commit }, id) {
    return documentationOpenService
      .findById(id)
      .then((data) => {
        //console.log(data);
        commit("SET_DOCUMENTATION", data)
      })
      .catch((err) => {
        console.log(err)
      })
  },
  update({ commit, dispatch }, payload) {
    return documentationService
      .update(payload)
      .then((data) => {
        commit("SET_DOCUMENTATION", data)
        dispatch("message/success", "Documentazione aggiornata!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },
  delete({ dispatch }, id) {
    return documentationService
      .delete(id)
      .then(() => {
        dispatch("findAll")
        dispatch("message/success", "Documentazione eliminata!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  }
}

const getters = {
  documentationList: (state) => {
    return state.documentationList
  },
  documentation: (state) => {
    return state.documentation
  }
}

export const documentation = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
}
