<template>
  <div class="support p-3">
    <div class="rounded shadow bg-white p-5">
      <div class="col-md-6">
        <span class="title mt-3"> loremipsum@lorum.ipsum </span>
        <input type="text" placeholder="subject" class="mt-4 form-control">
        <textarea name="message" placeholder="Message" rows="5" class="w-100 mt-3 form-control"></textarea>
        <div class="row actions mt-5">
          <div class="col-md-4">
            <button class="btn btn-md bg-purple text-white w-100"> SEND MESSAGE </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped lang="scss">
.support {

}
</style>
