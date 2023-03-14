import { tooltypeService } from "@/services"

const state = {
  tooltypeList: [],
  tooltype: null
}

const mutations = {
  SET_TOOLTYPELIST(state, tooltypeList) {
    state.tooltypeList = tooltypeList
  },
  SET_TOOLTYPE(state, tooltype) {
    state.tooltype = tooltype
  }
}

const actions = {
  /* findTooltype({ commit }, payload) {
    return tooltypeService
      .findServices(payload)
      .then(data => {
        commit("SET_TOOLTYPELIST", data);
      })
      .catch(err => {
        console.log(err);
      });
  }, */
  findAll({ commit }) {
    tooltypeService.findAll().then(
      (data) => {
        commit("SET_TOOLTYPELIST", data)
      },
      (error) => {
        console.log(error)
      }
    )
  },
  save({ commit, dispatch }, payload) {
    return tooltypeService
      .save(payload)
      .then((data) => {
        //console.log(data);
        commit("SET_TOOLTYPE", data)
        dispatch("message/success", "Tooltype salvato!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },
  findById({ commit }, id) {
    return tooltypeService
      .findById(id)
      .then((data) => {
        //console.log(data);
        commit("SET_TOOLTYPE", data)
      })
      .catch((err) => {
        console.log(err)
      })
  },
  update({ commit, dispatch }, payload) {
    return tooltypeService
      .update(payload)
      .then((data) => {
        commit("SET_TOOLTYPE", data)
        dispatch("message/success", "Tooltype aggiornato!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },
  delete({ dispatch }, id) {
    return tooltypeService
      .delete(id)
      .then(() => {
        dispatch("findAll")
        dispatch("message/success", "Tooltype eliminato!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  }
}

const getters = {
  tooltypeList: (state) => {
    return state.tooltypeList
  },
  tooltype: (state) => {
    return state.tooltype
  }
}

export const tooltype = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
}
