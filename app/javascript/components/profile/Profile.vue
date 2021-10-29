<template>
  <div class="profile p-3">
    <div class="content rounded shadow bg-white p-5">
      <div class="col-md-6">
        <span class="title mt-3"> john@doe.com </span>

        <div class="input-group mt-3">
          <span class="input-group-text" id="basic-addon1">
            <svg width="12" height="13" viewBox="0 0 12 13" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M6 2.35657C6.825 2.35657 7.5 3.03157 7.5 3.85657C7.5 4.68157 6.825 5.35657 6 5.35657C5.175 5.35657 4.5 4.68157 4.5 3.85657C4.5 3.03157 5.175 2.35657 6 2.35657ZM6 9.85657C8.025 9.85657 10.35 10.8241 10.5 11.3566H1.5C1.6725 10.8166 3.9825 9.85657 6 9.85657ZM6 0.856567C4.3425 0.856567 3 2.19907 3 3.85657C3 5.51407 4.3425 6.85657 6 6.85657C7.6575 6.85657 9 5.51407 9 3.85657C9 2.19907 7.6575 0.856567 6 0.856567ZM6 8.35657C3.9975 8.35657 0 9.36157 0 11.3566V12.8566H12V11.3566C12 9.36157 8.0025 8.35657 6 8.35657Z" fill="#A9A9A9"/>
            </svg>
          </span>
          <input type="text" placeholder="John Doe" class="form-control">
        </div>

        <div class="input-group mt-3">
          <span class="input-group-text" id="basic-addon1">
            <svg width="12" height="10" viewBox="0 0 12 10" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 1.25164C12 0.591636 11.46 0.0516357 10.8 0.0516357H1.2C0.54 0.0516357 0 0.591636 0 1.25164V8.45164C0 9.11164 0.54 9.65164 1.2 9.65164H10.8C11.46 9.65164 12 9.11164 12 8.45164V1.25164ZM10.8 1.25164L6 4.25164L1.2 1.25164H10.8ZM10.8 8.45164H1.2V2.45164L6 5.45164L10.8 2.45164V8.45164Z" fill="#A9A9A9"/>
            </svg>
          </span>
          <input type="text" placeholder="loremipsum@lorum.ipsum" class="form-control">
        </div>

        <div class="input-group mt-3">
          <span class="input-group-text" id="basic-addon1">
            <svg width="12" height="17" viewBox="0 0 12 17" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M10.5 5.74792H9.75V4.24792C9.75 2.17792 8.07 0.497925 6 0.497925C3.93 0.497925 2.25 2.17792 2.25 4.24792V5.74792H1.5C0.675 5.74792 0 6.42292 0 7.24792V14.7479C0 15.5729 0.675 16.2479 1.5 16.2479H10.5C11.325 16.2479 12 15.5729 12 14.7479V7.24792C12 6.42292 11.325 5.74792 10.5 5.74792ZM3.75 4.24792C3.75 3.00292 4.755 1.99792 6 1.99792C7.245 1.99792 8.25 3.00292 8.25 4.24792V5.74792H3.75V4.24792ZM10.5 14.7479H1.5V7.24792H10.5V14.7479ZM6 12.4979C6.825 12.4979 7.5 11.8229 7.5 10.9979C7.5 10.1729 6.825 9.49792 6 9.49792C5.175 9.49792 4.5 10.1729 4.5 10.9979C4.5 11.8229 5.175 12.4979 6 12.4979Z" fill="#A9A9A9"/>
            </svg>
          </span>
          <input type="text" placeholder="************" class="form-control">
        </div>

        <div class="input-group mt-3">
          <span class="input-group-text" id="basic-addon1">
            <svg width="12" height="17" viewBox="0 0 12 17" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M10.5 5.74792H9.75V4.24792C9.75 2.17792 8.07 0.497925 6 0.497925C3.93 0.497925 2.25 2.17792 2.25 4.24792V5.74792H1.5C0.675 5.74792 0 6.42292 0 7.24792V14.7479C0 15.5729 0.675 16.2479 1.5 16.2479H10.5C11.325 16.2479 12 15.5729 12 14.7479V7.24792C12 6.42292 11.325 5.74792 10.5 5.74792ZM3.75 4.24792C3.75 3.00292 4.755 1.99792 6 1.99792C7.245 1.99792 8.25 3.00292 8.25 4.24792V5.74792H3.75V4.24792ZM10.5 14.7479H1.5V7.24792H10.5V14.7479ZM6 12.4979C6.825 12.4979 7.5 11.8229 7.5 10.9979C7.5 10.1729 6.825 9.49792 6 9.49792C5.175 9.49792 4.5 10.1729 4.5 10.9979C4.5 11.8229 5.175 12.4979 6 12.4979Z" fill="#A9A9A9"/>
            </svg>
          </span>
          <input type="text" placeholder="************" class="form-control">
        </div>

        <div class="row actions mt-5">
          <div class="col-md-3">
            <button class="btn btn-md bg-purple text-white w-100"> UPDATE </button>
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
.profile {
  .content {
    @media only screen and (max-width: 575px) {
      padding: 30px 10px !important;
    }
  }
}
</style>
