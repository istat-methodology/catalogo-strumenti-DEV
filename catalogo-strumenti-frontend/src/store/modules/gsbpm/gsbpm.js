import { gsbpmService } from "@/services";

const state = {
  gsbpmList: [],
  gsbpm: null
};

const mutations = {
  SET_GSBPMLIST(state, gsbpmList) {
    state.gsbpmList = gsbpmList;
  },
  SET_GSBPM(state, gsbpm) {
    state.service = gsbpm;
  }
};

const actions = {
  findGsbpm({ commit }, payload) {
    return gsbpmService
      .findServices(payload)
      .then(data => {
        commit("SET_GSBPMLIST", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  findAll({ commit }) {
    gsbpmService.findAll().then(
      data => {
        commit("SET_GSBPMLIST", data);
      },
      error => {
        console.log(error);
      }
    );
  },
  save({ commit, dispatch }, payload) {
    return gsbpmService
      .save(payload)
      .then(data => {
        //console.log(data);
        commit("SET_GSBPM", data);
        dispatch("message/success", "Gsbpm salvato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  findById({ commit }, id) {
    return gsbpmService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_GSBPM", data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  update({ commit, dispatch }, payload) {
    return gsbpmService
      .update(payload)
      .then(data => {
        commit("SET_GSBPM", data);
        dispatch("message/success", "Gsbpm aggiornato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  },
  delete({ dispatch }, id) {
    return gsbpmService
      .delete(id)
      .then(() => {
        dispatch("findAll");
        dispatch("message/success", "Gsbpm eliminato!", {
          root: true
        });
      })
      .catch(err => {
        console.log(err);
      });
  }
};

const getters = {
  gsbpmList: state => {
    return state.gsbpmList;
  },
  gsbpm: state => {
    return state.gsbpm;
  }
};

export const gsbpm = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
