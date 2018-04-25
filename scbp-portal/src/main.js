import Vue from 'vue'
import App from './App'
import mixins from '@/mixins'
import Router from 'vue-router'
import { createRouter } from '@/config/routes'
import { sync } from 'vuex-router-sync'
import { apistore } from '@/config/api/api.store'
import directive from '@/directives'
import * as filters from '@/filters'
import { createStore } from '@/store'
import eventbus from '@/store/eventbus'
import VueI18n from 'vue-i18n'
import messages from '@/config/i18n'
import ProgressBar from '@/components/ProgressBar.vue'
import BootstrapVue from 'bootstrap-vue'

Object.keys(filters).forEach(key => {
  Vue.filter(key, filters[key])
})

Vue.use(BootstrapVue)
Vue.use(directive)
Vue.use(Router)
Vue.use(VueI18n)
Vue.mixin(mixins)

const store = createStore()
const router = createRouter()
sync(store, router)
const i18n = new VueI18n({
  locale: 'zh',
  messages
})

const bar = Vue.prototype.$bar = new Vue(ProgressBar).$mount()
document.body.appendChild(bar.$el)

Vue.prototype.$api = apistore
Vue.prototype.$eventbus = eventbus
Vue.config.productionTip = false
Vue.config.devtools = true
Vue.config.debug = true
/* eslint-disable no-new */
new Vue({
  el: '#app',
  store,
  i18n,
  router,
  template: '<App/>',
  components: { App }
})
