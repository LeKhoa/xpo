<template>
  <div class="home">
    <router-view :key="$route.fullPath" />
  </div>
</template>

<script>

export default {
  components: {
  },

  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped lang="scss">
.home {
}
</style>
