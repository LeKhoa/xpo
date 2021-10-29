<template>
  <div id="app">
    <div class="row m-0">
      <div class="col-lg-3 col-xl-2 col-md-12">
        <Menu />
      </div>
      <div class="col-lg-9 col-xl-10 col-md-12">
        <Content />
      </div>
    </div>
  </div>
</template>

<script>

// Home
import Content from './home/Content.vue'
import Menu from './home/Menu.vue'

import { mapState, mapActions } from 'vuex';

export default {
  components: {
    Menu, Content,
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
