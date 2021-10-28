<template>
  <Home />
</template>

<script>

// Home
import Home from './home/Home.vue'

import { mapState, mapActions } from 'vuex';

export default {
  components: {
    Home,
  },

  props: ['dataCurrentUser'],

  data: function () {
    return {
      step: 0,
    }
  },

  methods: {
    ...mapActions(['setCurrentUser']),

    nextStep() {
      this.step++;
    },
  },

  computed: {

  },

  mounted() {
    this.setCurrentUser(this.dataCurrentUser);
  }
}
</script>

<style scoped="scss">

</style>
