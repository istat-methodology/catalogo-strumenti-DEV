import { agentService } from "@/services";

const state = {
  agentList: [],
  agent: null
};

const mutations = {
  SET_AGENTLIST(state, agentList) {
    state.agentList = agentList;
  },
  SET_AGENT(state, agent) {
    state.agent = agent;
  }
};

const actions = {
  findGsbpm({ commit }, payload) {
    return agentService
      .findServices(payload)
      .then(data => {
        commit("SET_AGENTLIST", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  findAll({ commit }) {
    agentService.findAll().then(
      data => {
        commit("SET_AGENTLIST", data);
      },
      error => {
        console.log(error);
      }
    );
  },
  save({ commit, dispatch }, payload) {
    return agentService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_AGENT", data);
        dispatch("message/success", "Agent salvato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return agentService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_AGENT", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return agentService
      .update(payload)
      .then(data => {
        commit("SET_AGENT", data);
        dispatch("message/success", "Agent aggiornato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return agentService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Agent eliminato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  agentList: state => {
    return state.agentList;
  },
  agent: state => {
    return state.agent;
  }
};

export const agent = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
