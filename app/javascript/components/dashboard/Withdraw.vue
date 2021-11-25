<template>
  <div class="withdraw">
    <div class="row m-0 p-3">
      <div class="ps-0 pe-2">
        <div class="content rounded shadow bg-white p-4">
          <div class="row">
            <div class="col-md-5 p-4">
              <div class="border rounded p-4">
                <label> Amount in USD </label>
                <div class="input-group mt-2">
                  <span class="input-group-text" id="basic-addon1">
                    <svg width="11" height="18" viewBox="0 0 11 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M5.89003 7.9C3.62003 7.31 2.89003 6.7 2.89003 5.75C2.89003 4.66 3.90003 3.9 5.59003 3.9C7.37003 3.9 8.03003 4.75 8.09003 6H10.3C10.23 4.28 9.18003 2.7 7.09003 2.19V0H4.09003V2.16C2.15003 2.58 0.590034 3.84 0.590034 5.77C0.590034 8.08 2.50003 9.23 5.29003 9.9C7.79003 10.5 8.29003 11.38 8.29003 12.31C8.29003 13 7.80003 14.1 5.59003 14.1C3.53003 14.1 2.72003 13.18 2.61003 12H0.410034C0.530034 14.19 2.17003 15.42 4.09003 15.83V18H7.09003V15.85C9.04003 15.48 10.59 14.35 10.59 12.3C10.59 9.46 8.16003 8.49 5.89003 7.9Z" fill="#131031"/>
                    </svg>
                  </span>
                  <input type="text" class="form-control" v-model="usdAmount">
                </div>

                <label class="mt-3"> Currency </label>
                <div class="input-group mt-2">
                  <span class="input-group-text" id="basic-addon2">
                    <svg width="17" height="18" viewBox="0 0 17 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M4.42717 8.07895H2.74296V13.9737H4.42717V8.07895ZM9.4798 8.07895H7.79559V13.9737H9.4798V8.07895ZM16.6377 15.6579H0.637695V17.3421H16.6377V15.6579ZM14.5324 8.07895H12.8482V13.9737H14.5324V8.07895ZM8.6377 2.40316L13.0251 4.71053H4.25033L8.6377 2.40316ZM8.6377 0.5L0.637695 4.71053V6.39474H16.6377V4.71053L8.6377 0.5Z" fill="#131031"/>
                    </svg>
                  </span>
                  <select class="form-select shadow-none rounded-0" v-model="currency">
                    <option value="BTC"> BTC </option>
                    <option value="ETH"> ETH </option>
                    <option value="BNB"> BNB </option>
                    <option value="USDT"> USDT </option>
                  </select>
                </div>

                <label class="mt-3"> Network </label>
                <div class="input-group mt-2">
                  <span class="input-group-text" id="basic-addon3">
                    <svg width="17" height="18" viewBox="0 0 17 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M4.42717 8.07895H2.74296V13.9737H4.42717V8.07895ZM9.4798 8.07895H7.79559V13.9737H9.4798V8.07895ZM16.6377 15.6579H0.637695V17.3421H16.6377V15.6579ZM14.5324 8.07895H12.8482V13.9737H14.5324V8.07895ZM8.6377 2.40316L13.0251 4.71053H4.25033L8.6377 2.40316ZM8.6377 0.5L0.637695 4.71053V6.39474H16.6377V4.71053L8.6377 0.5Z" fill="#131031"/>
                    </svg>
                  </span>
                  <select class="form-select shadow-none rounded-0" v-model="network">
                    <option value="BTC"> BTC </option>
                    <option value="ETH"> ERC20 </option>
                    <option value="TRX"> TRC20 </option>
                    <option value="BSC"> BEP20 </option>
                  </select>
                </div>

                <label class="mt-3"> Receive Address </label>
                <div class="input-group mt-2">
                  <span class="input-group-text" id="basic-addon1">
                    <svg width="17" height="18" viewBox="0 0 17 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M4.42717 8.07895H2.74296V13.9737H4.42717V8.07895ZM9.4798 8.07895H7.79559V13.9737H9.4798V8.07895ZM16.6377 15.6579H0.637695V17.3421H16.6377V15.6579ZM14.5324 8.07895H12.8482V13.9737H14.5324V8.07895ZM8.6377 2.40316L13.0251 4.71053H4.25033L8.6377 2.40316ZM8.6377 0.5L0.637695 4.71053V6.39474H16.6377V4.71053L8.6377 0.5Z" fill="#131031"/>
                    </svg>
                  </span>
                  <input type="text" class="form-control" v-model="address">
                </div>

                <div class="row mt-3 justify-content-center" v-if="withdrawing">
                  <div class="spinner">
                    <div class="spinner-blade" v-for="i in 12">
                    </div>
                  </div>
                  <span class="fw-bold text-center text-success"> We are evaluating your balance... </span>
                </div>

                <div v-if="error" class="text-center text-danger mt-5"> {{error}} </div>

                <div class="row actions justify-content-center mt-5">
                  <div class="col-md-5 col-sm-4 col-6">
                    <button :class="{disabled: withdrawing }" class="btn btn-md bg-purple text-white w-100" @click="createWithdrawal()"> Widthdraw </button>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-7 p-4">
              <div class="border rounded h-100 p-4">
                <div class="fw-bold title"> Balances </div>
                <div class="mt-3 d-flex flex-wrap balance">
                  <div v-for="balance in rebalancing_balances.filter(bl => bl.usdValue > 0.5)" class="col-md-6 mt-4">
                    <div> 
                      <span class="fw-bold symbol"> {{balance.symbol}} </span>
                    </div>
                    <div> <span>Amount: </span><span class="fw-bold item"> {{balance.nativeValue.toFixed(6)}} </span>
                    </div>
                    <div> <span>BTC value: </span><span class="fw-bold item"> {{balance.btcValue.toFixed(6)}}</span>
                    </div>
                    <div> <span>USD value: </span><span class="fw-bold item"> {{balance.usdValue.toFixed(6)}}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';

export default {
  data () {
    return {
      usdAmount: 100,
      currency: '',
      address: '',
      network: '',
      error: '',
      withdrawing: false,
      rebalancing_balances: [],
    }
  },

  methods: {

    createWithdrawal() {
      this.error = '';

      if(!this.usdAmount || !this.currency || !this.network || !this.address) {
        return this.error = 'Please fill all parameters';
      }
      this.withdrawing = true;
      let params = {
        amount: this.usdAmount,
        currency: this.currency,
        network: this.network,
        address: this.address,
      }

      this.$http.post(`/api/shrimpy/withdraw`, params)
        .then(response => {
          this.withdrawing = false;
          this.msg = 'Create withdrawal successfull';
          console.log(response.data.trade_ids);
        }).catch(error => {
          this.withdrawing = false;
          this.error = error.response.data.message;
      });
    },

    getRebalancingBalances() {
      this.$http.get('/api/shrimpy/rebalancing_balance')
        .then(response => {
          this.rebalancing_balances = response.data.balances;
          console.log(this.rebalancing_balances)
        }).catch(error => {
          this.balanceError = error.response.data.message;
      });
    },
  },

  computed: {
    ...mapState(['currentUser']),
    

  },

  mounted() {
    this.getRebalancingBalances();
  }
}
</script>

<style scoped lang="scss">
.withdraw {
  .balance {
    .item {
      font-size: 18px;
    }

    .title {
      color: #451089;
      font-size: 28px;
    }

    .symbol {
      color: #451089;
      font-size: 18px;
    }
  }

  $spinner-color: #69717d !default;

  .devise-form {
    border: 1px solid #ced4da;
  }

  .spinner {
    font-size: 25px;
    position: relative;
    display: inline-block;
    width: 1em;
    height: 1em;
  }

  .spinner-blade {
    position: absolute;
    left: .4629em;
    bottom: 0;
    width: .074em;
    height: .2777em;
    border-radius: .5em;
    background-color: transparent;
    transform-origin: center -.2222em;
    animation: spinner-fade 1s infinite linear;

    $animation-delay: 0s;
    $blade-rotation: 0deg;

    @for $i from 1 through 12 {
      &:nth-child(#{$i}) {
        animation-delay: $animation-delay;
        transform: rotate($blade-rotation);
        $blade-rotation: $blade-rotation + 30;
        $animation-delay: $animation-delay + .083;
      }
    }
  }

  @keyframes spinner-fade {
    0% {
      background-color: $spinner-color;
    }

    100% {
      background-color: transparent;
    }
  }

}
</style>
