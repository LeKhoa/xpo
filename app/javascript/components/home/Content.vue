<template>
  <div class="content">
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
.content {

}
</style>
