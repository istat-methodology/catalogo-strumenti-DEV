import { addressService } from "@/services";
import { getUserId } from "@/common";

const state = {
  addresses: null,
  address: null,
  filterComune: null,
  filterAddress: null,
  filterValidazione: null,
  /* filterDate: null,
  sortComune: null,
  sortAddress: null,
  sortDate: null, */
  currentIndex: 0,
  currentId: localStorage.getItem("addressId") || -1,
  assignedId: localStorage.getItem("assignedId") || -1,
  assignedName: localStorage.getItem("assignedName") || ""
};

const mutations = {
  SET_ADDRESSES(state, addresses) {
    state.addresses = addresses;
  },
  SET_ADDRESS(state, address) {
    state.address = address;
  },
  SET_CURRENT_ID(state, id) {
    state.currentId = id;
    //store current address in browser storage
    localStorage.setItem("addressId", id);
  },
  SET_CURRENT_INDEX(state, id) {
    state.currentIndex = id;
  },
  SET_ASSIGNED(state, user) {
    state.assignedId = user.id;
    state.assignedName = user.name;
    //store assigned user in browser storage
    localStorage.setItem("assignedId", user.id);
    localStorage.setItem("assignedName", user.name);
  },
  CLEAR_ASSIGNED(state) {
    state.assignedId = -1;
    state.assignedName = "";
  },
  SET_FILTER_COMUNE(state, comune) {
    state.filterComune = comune;
  },
  SET_FILTER_ADDRESS(state, address) {
    state.filterAddress = address;
  },
  SET_FILTER_VALIDAZIONE(state, validazione) {
    state.filterValidazione = validazione;
  }
  /*  SET_FILTER_DATE(state, date) {
    state.filterDate = date;
  },
  SET_SORT_COMUNE(state, sort) {
    state.sortComune = sort;
  },
  SET_SORT_ADDRESS(state, sort) {
    state.sortAddress = sort;
  },
  SET_SORT_DATE(state, sort) {
    state.sortDate = sort;
  } */
};

const actions = {
  setFilterComune: ({ commit }, comune) => {
    commit("SET_FILTER_COMUNE", comune);
  },

  setFilterAddress: ({ commit }, address) => {
    commit("SET_FILTER_ADDRESS", address);
  },
  setFilterValidazione: ({ commit }, validazione) => {
    commit("SET_FILTER_VALIDAZIONE", validazione);
  },

  /* setFilterDate: ({ commit }, address) => {
    commit("SET_FILTER_DATE", address);
  },
   setSortComune: ({ commit }, comune) => {
    commit("SET_SORT_COMUNE", comune);
  },

  setSortAddress: ({ commit }, address) => {
    commit("SET_SORT_ADDRESS", address);
  },

  setSortDate: ({ commit }, address) => {
    commit("SET_SORT_DATE", address);
  }, */

  setSortedList({ commit }, addressList) {
    var newlist = addressList.map((items, index = 0) => ({
      ...items,
      index: index + 1,
      selected: false
    }));
    commit("SET_ADDRESSES", newlist);
  },

  findAll({ commit }) {
    return addressService
      .findAll()
      .then(data => {
        commit("SET_ADDRESSES", data);
        commit("SET_ADDRESS", null); //clear businessService
      })
      .catch(err => {
        console.log(err);
      });
  },

  findByUserAndState({ commit }, stateId) {
    //get user from store
    let userId = getUserId();
    if (userId > 0) {
      return addressService
        .findByUserAndState(
          userId,
          stateId,
          state.filterComune ? state.filterComune.proCom : null,
          state.filterAddress,
          state.filterValidazione ? state.filterValidazione.value : null
        )
        .then(data => {
          //console.log(data);
          commit("SET_ADDRESSES", data);
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  findNextAddress({ commit }) {
    //get user from store

    //console.log(data);
    var status = null;

    status = state.addresses[state.currentIndex - 1];
    if (status) {
      commit("SET_ADDRESS", state.addresses[state.currentIndex - 1]);
      commit(
        "SET_CURRENT_ID",
        state.addresses[state.currentIndex - 1].progressivoIndirizzo
      );
      return true;
    }
    return false;
  },

  findNextAddressToWorkSoon({ commit }, stateId) {
    //get user from store
    let userId = getUserId();
    if (userId > 0) {
      return addressService
        .findNextAddress(
          userId,
          stateId,
          state.filterComune ? state.filterComune.proCom : null,
          state.filterAddress,
          state.filterValidazione ? state.filterValidazione.value : null
        )
        .then(data => {
          //console.log(data);
          commit("SET_ADDRESS", data);
          commit("SET_CURRENT_ID", data.progressivoIndirizzo);
          return data;
        })
        .catch(err => {
          console.log(err);
        });
    }
  },

  findById({ commit }, id) {
    return addressService
      .findById(id)
      .then(data => {
        //console.log(data);
        commit("SET_ADDRESS", data);
      })
      .catch(err => {
        console.log(err);
      });
  },

  update({ commit }, formData) {
    addressService
      .update(formData)
      .then(() => {
        commit("SET_ADDRESS", null);
      })
      .catch(err => {
        console.log(err);
      });
  },

  open({ commit }, formData) {
    addressService
      .update(formData)
      .then(data => {
        commit("SET_ADDRESS", data);
      })
      .catch(err => {
        console.log(err);
      });
  },

  setCurrentId({ commit }, id) {
    commit("SET_CURRENT_ID", id);
  },
  updateCurrentIndex({ commit }) {
    commit("SET_CURRENT_INDEX", state.currentIndex + 1);
  },
  setCurrentIndex({ commit }, id) {
    commit("SET_CURRENT_INDEX", id);
  },

  setAssigned({ commit }, user) {
    commit("SET_ASSIGNED", user);
  },

  clearAssigned({ commit }) {
    commit("CLEAR_ASSIGNED");
  },

  clear({ commit }) {
    commit("SET_ADDRESSES", null);
    commit("SET_ADDRESS", null);
  },

  clearFilters({ commit }) {
    commit("SET_FILTER_COMUNE", null);
    commit("SET_FILTER_ADDRESS", null);
    commit("SET_FILTER_VALIDAZIONE", null);
  }
};

const getters = {
  addresses: state => {
    return state.addresses;
  },
  address: state => {
    return state.address;
  },
  currentId: state => {
    return state.currentId;
  },
  assignedId: state => {
    return state.assignedId;
  },
  assignedName: state => {
    return state.assignedName;
  },
  filterComune: state => {
    return state.filterComune;
  },
  filterAddress: state => {
    return state.filterAddress;
  },
  filterValidazione: state => {
    return state.filterValidazione;
  }
  /* filterDate: state => {
    return state.filterDate;
  },
  sortComune: state => {
    return state.sortComune;
  },
  sortAddress: state => {
    return state.sortAddress;
  },
  sortProcom: state => {
    return state.sortDate;
  } */
};

export const address = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};
