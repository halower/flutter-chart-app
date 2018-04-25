<template>
   <iframe :src='getCurrentUrl(this.$route.name)' frameborder="0" width="100%" height="100%"></iframe> 
</template>
<script>
import { createNamespacedHelpers } from 'vuex'
const { mapGetters } = createNamespacedHelpers('system')
export default {
  name: 'gateway',
  computed: {
    ...mapGetters(['getCurrentUrl'])
  }
}
</script>