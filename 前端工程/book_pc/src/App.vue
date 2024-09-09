<template>
  <div class="container-fluid">
      <top-bar></top-bar>
      <router-view />
  </div>
</template>
<script>
import TopBar from './components/TopBar.vue'
import { globalEventEmitter } from './utils/util'
export default {
  components: {
      TopBar
  },
  provide: {
      eventBus: globalEventEmitter
  }
}
</script>


