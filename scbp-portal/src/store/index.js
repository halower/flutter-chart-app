import Vue from 'vue'
import Vuex from 'vuex'

import system from './modules/system'
Vue.use(Vuex)

export const mutations = {
}

export const actions = {
}

export const getters = {
}

Vue.use(Vuex)

export function createStore () {
  return new Vuex.Store({
    modules: {
      system
    },
    state: {},
    actions,
    mutations,
    getters
  })
}
