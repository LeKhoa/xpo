<template>
  <div id="app">
    <div class="row m-0">
      <div class="col-md-2">
        <Menu />
      </div>
      <div class="col-md-10">
        <Home />
      </div>
    </div>
  </div>
</template>

<script>

// Home
import Home from './home/Home.vue'
import Menu from './home/Menu.vue'

import { mapState, mapActions } from 'vuex';

export default {
  components: {
    Menu, Home,
  },

  props: ['dataCurrentUser'],

  data: function () {
    return {
      step: 0,
    }
  },

  methods: {
    ...mapActions(['setCurrentUser']),

  },

  computed: {

  },

  mounted() {
    this.setCurrentUser(this.dataCurrentUser);
  }
}
</script>

<style scoped lang="scss">

</style>
