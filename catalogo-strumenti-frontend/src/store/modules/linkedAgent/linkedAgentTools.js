import { linkedAgentService } from "@/services"
import { linkedAgentOpenService } from "@/services"

const state = {
  linkedAgentList: [],
  linkedAgent: null
}

const mutations = {
  SET_LINKEDAGENTLIST(state, linkedAgentList) {
    state.linkedAgentList = linkedAgentList
  },
  SET_LINKEDAGENT(state, linkedAgent) {
    state.linkedAgent = linkedAgent
  }
}

const actions = {
  save({ commit, dispatch }, payload) {
    return linkedAgentService
      .save(payload)
      .then((data) => {
        //console.log(data);
        commit("SET_LINKEDAGENT", data)

        dispatch("message/success", "Associazione salvata!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },
  findByCatalogTool({ commit }, id) {
    return linkedAgentOpenService
      .findByCatalogTool(id)
      .then((data) => {
        //console.log(data);
        commit("SET_LINKEDAGENTLIST", data)
      })
      .catch((err) => {
        console.log(err)
      })
  },

  update({ commit, dispatch }, payload) {
    return linkedAgentService
      .update(payload)
      .then((data) => {
        commit("SET_LINKEDAGENT", data)

        dispatch("message/success", "Associazione aggiornata!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },
  delete({ dispatch }, id) {
    return linkedAgentService
      .delete(id)
      .then(() => {
        dispatch("message/success", "Associazione eliminata!", {
          root: true
        })
      })
      .catch((err) => {
        console.log(err)
      })
  }
}

const getters = {
  linkedAgentList: (state) => {
    return state.linkedAgentList
  },
  linkedAgent: (state) => {
    return state.linkedAgent
  }
}

export const linkedagent = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
}
