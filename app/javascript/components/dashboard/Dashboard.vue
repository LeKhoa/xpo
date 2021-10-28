<template>
  <div class="dashboard">
    <div class="row m-0 p-3">
      <div class="col-md-4 ps-0 pe-2">
        <div class="rounded shadow bg-white p-5">
          <div class="pb-5">
            <label> Amount </label>
            <div class="input-group mt-2">
              <span class="input-group-text" id="basic-addon1">
                <svg width="11" height="18" viewBox="0 0 11 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M5.89003 7.9C3.62003 7.31 2.89003 6.7 2.89003 5.75C2.89003 4.66 3.90003 3.9 5.59003 3.9C7.37003 3.9 8.03003 4.75 8.09003 6H10.3C10.23 4.28 9.18003 2.7 7.09003 2.19V0H4.09003V2.16C2.15003 2.58 0.590034 3.84 0.590034 5.77C0.590034 8.08 2.50003 9.23 5.29003 9.9C7.79003 10.5 8.29003 11.38 8.29003 12.31C8.29003 13 7.80003 14.1 5.59003 14.1C3.53003 14.1 2.72003 13.18 2.61003 12H0.410034C0.530034 14.19 2.17003 15.42 4.09003 15.83V18H7.09003V15.85C9.04003 15.48 10.59 14.35 10.59 12.3C10.59 9.46 8.16003 8.49 5.89003 7.9Z" fill="#131031"/>
                </svg>
              </span>
              <input type="text" class="form-control">
            </div>

            <label class="mt-4"> Payment Method </label>
            <div class="input-group mt-2">
              <span class="input-group-text" id="basic-addon1">
                <svg width="17" height="18" viewBox="0 0 17 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M4.42717 8.07895H2.74296V13.9737H4.42717V8.07895ZM9.4798 8.07895H7.79559V13.9737H9.4798V8.07895ZM16.6377 15.6579H0.637695V17.3421H16.6377V15.6579ZM14.5324 8.07895H12.8482V13.9737H14.5324V8.07895ZM8.6377 2.40316L13.0251 4.71053H4.25033L8.6377 2.40316ZM8.6377 0.5L0.637695 4.71053V6.39474H16.6377V4.71053L8.6377 0.5Z" fill="#131031"/>
                </svg>
              </span>
              <input type="text" class="form-control">
            </div>
          </div>

          <div class="row actions pt-4 mt-5">
            <div class="col-md-6">
              <button class="btn btn-md bg-purple text-white w-100"> Deposit </button>
            </div>
            <div class="col-md-6">
              <button class="btn btn-md bg-purple text-white w-100"> Widthdraw </button>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-8 ps-2 pe-0">
        <div class="rounded shadow bg-white h-100">
          <div class="row h-100 m-0">
            <div class="col-md-5 d-flex flex-column justify-content-between assets p-2 pb-3">
              <div class="col-md-12 text-center rounded shadow p-3">
                <span class="title"> Mid Cap Strategy and Coin Holdings </span>
                <div class="mt-3 pb-4">
                  <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M16 32C7.163 32 0 24.837 0 16C0 7.163 7.163 0 16 0C24.837 0 32 7.163 32 16C32 24.837 24.837 32 16 32ZM23.189 14.02C23.503 11.924 21.906 10.797 19.724 10.045L20.432 7.205L18.704 6.775L18.014 9.54C17.56 9.426 17.094 9.32 16.629 9.214L17.324 6.431L15.596 6L14.888 8.839C14.512 8.753 14.142 8.669 13.784 8.579L13.786 8.57L11.402 7.975L10.942 9.821C10.942 9.821 12.225 10.115 12.198 10.133C12.898 10.308 13.024 10.771 13.003 11.139L12.197 14.374C12.245 14.386 12.307 14.404 12.377 14.431L12.194 14.386L11.064 18.918C10.978 19.13 10.761 19.449 10.271 19.328C10.289 19.353 9.015 19.015 9.015 19.015L8.157 20.993L10.407 21.554C10.825 21.659 11.235 21.769 11.638 21.872L10.923 24.744L12.65 25.174L13.358 22.334C13.83 22.461 14.288 22.579 14.736 22.691L14.03 25.519L15.758 25.949L16.473 23.083C19.421 23.641 21.637 23.416 22.57 20.75C23.322 18.604 22.533 17.365 20.982 16.558C22.112 16.298 22.962 15.555 23.189 14.02V14.02ZM19.239 19.558C18.706 21.705 15.091 20.544 13.919 20.253L14.869 16.448C16.041 16.741 19.798 17.32 19.239 19.558ZM19.774 13.989C19.287 15.942 16.279 14.949 15.304 14.706L16.164 11.256C17.139 11.499 20.282 11.952 19.774 13.989Z" fill="#A9A9A9"/>
                  </svg>
                  <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M16 32C7.163 32 0 24.837 0 16C0 7.163 7.163 0 16 0C24.837 0 32 7.163 32 16C32 24.837 24.837 32 16 32ZM23.994 16.219L16.498 4L9 16.22L16.498 20.573L23.994 16.219ZM24 17.616L16.498 21.967L9 17.617L16.498 27.995L24 17.616Z" fill="#A9A9A9"/>
                  </svg>
                  
                  <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M16 32C7.163 32 0 24.837 0 16C0 7.163 7.163 0 16 0C24.837 0 32 7.163 32 16C32 24.837 24.837 32 16 32ZM10.482 16.896V24H17.031C18.241 24 19.288 23.79 20.173 23.373C21.058 22.954 21.78 22.383 22.341 21.658C22.901 20.934 23.318 20.086 23.591 19.115C23.864 18.144 24 17.105 24 16C24.0069 14.9478 23.8689 13.8996 23.59 12.885C23.318 11.915 22.901 11.066 22.34 10.342C21.78 9.617 21.058 9.046 20.173 8.627C19.288 8.21 18.24 8 17.03 8H10.481V14.61H9V16.896H10.482ZM13.248 14.611V10.286H15.969C17.046 10.286 17.927 10.431 18.613 10.723C19.299 11.014 19.837 11.417 20.228 11.933C20.6279 12.4696 20.9001 13.0903 21.024 13.748C21.164 14.443 21.234 15.193 21.234 16C21.2388 16.7558 21.1685 17.5102 21.024 18.252C20.884 18.947 20.619 19.552 20.228 20.067C19.837 20.583 19.298 20.986 18.613 21.277C17.927 21.569 17.046 21.714 15.969 21.714H13.248V16.896H17.562V14.611H13.248Z" fill="#A9A9A9"/>
                  </svg>
                  <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M16 32C7.163 32 0 24.837 0 16C0 7.163 7.163 0 16 0C24.837 0 32 7.163 32 16C32 24.837 24.837 32 16 32ZM12.116 14.404L16 10.52L19.886 14.406L22.146 12.146L16 6L9.856 12.144L12.116 14.404ZM6 16L8.26 18.26L10.52 16L8.26 13.74L6 16ZM12.116 17.596L9.853 19.853L9.856 19.856L16 26L22.146 19.854V19.853L19.886 17.593L16 21.48L12.116 17.596ZM21.48 16L23.74 18.26L26 16L23.74 13.74L21.48 16ZM18.292 15.998H18.293L16 13.706L14.305 15.4L14.11 15.595L13.709 15.997L13.705 16L13.709 16.003L15.999 18.294L18.293 16.001L18.294 16L18.292 15.999V15.998Z" fill="#A9A9A9"/>
                  </svg>
                </div>
              </div>

              <div class="balance mt-5 align-items-end">
                <div class="col-md-11 text-center rounded shadow p-3">
                  <span class="title"> USD BALANCE </span>
                  <div class="amount"> 724.53USD </div>
                </div>
              </div>
            </div>

            <div class="col-md-7 chart p-5 h-100">
              <span class="title fw-bold"> Portfolio Performance </span>
              <!-- CHART -->
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="rate px-3 mt-3">
      <div class="row m-0 justify-content-between rounded shadow bg-white p-3">
        <div class="col-md-2 text-center border-end">
          <div class="pair">
            <span> ZRX | BTC </span> <span class="text-danger"> -2.07% </span>
          </div>
          <div class="price mt-1"> 0.268135 USD </div>
          <div class="volume mt-1"> Volume 65,908 BTC </div>
        </div>

        <div class="col-md-2 text-center border-end">
          <div class="pair">
            <span> ETH | BTC </span> <span class="text-success"> +0.47% </span>
          </div>
          <div class="price mt-1"> 159.55 USD </div>
          <div class="volume mt-1"> Volume 12,234 BTC </div>
        </div>
      
        <div class="col-md-2 text-center border-end">
          <div class="pair">
            <span> LTC | BTC </span> <span class="text-success"> +1.28% </span>
          </div>
          <div class="price mt-1"> 73.40 USD </div>
          <div class="volume mt-1"> Volume 34,601 BTC </div>
        </div>

        <div class="col-md-2 text-center border-end">
          <div class="pair">
            <span> ETC | BTC </span> <span class="text-danger"> -0.44%  </span>
          </div>
          <div class="price mt-1"> 5.715 USD </div>
          <div class="volume mt-1"> Volume 67,601 BTC </div>
        </div>
      
        <div class="col-md-2 text-center border-end">
          <div class="pair">
            <span> BCH | BTC </span> <span class="text-success"> +0.43% </span>
          </div>
          <div class="price mt-1"> 268.00 USD </div>
          <div class="volume mt-1"> Volume 87,601 BTC </div>
        </div>

        <div class="col-md-2 text-center border-end">
          <div class="pair">
            <span> XRP | BTC </span> <span class="text-danger"> -0.54% </span>
          </div>
          <div class="price mt-1"> 0.2970 USD </div>
          <div class="volume mt-1"> Volume 13,601 BTC </div>
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
  .dashboard {

  }
</style>
