<template>
  <div class="app" style="width:100%;height:100%">
    <AppHeader/>
    <div class="app-body"  style="width:100%;height:100%">
      <Sidebar :navItems="nav"/>
      <main class="main" style="width:100%;height:100%;overflow: hidden;">
        <breadcrumb :list="list" style="margin-bottom: 0;"/>
        <div class="container-fluid" style="padding:0;width:100%;height:100%">
          <router-view></router-view>
        </div>
      </main>
    </div>
    <AppFooter/>
  </div>
</template>

<script>
import nav from '@/_nav'
import { Header as AppHeader, Sidebar, Footer as AppFooter, Breadcrumb } from '@/components/'

export default {
  name: 'full',
  components: {
    AppHeader,
    Sidebar,
    AppFooter,
    Breadcrumb
  },
  data () {
    return {
      nav: nav.items
    }
  },
  computed: {
    name () {
      return this.$route.name
    },
    list () {
      return this.$route.matched
    }
  }
}
</script>
<style>
html,body{
  height: 100%;
  width: 100%;
  padding: 0;
  margin: 0;
}
</style>
