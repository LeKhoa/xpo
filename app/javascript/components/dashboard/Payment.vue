<template>
  <div class="payment p-3">
    <div class="content rounded shadow bg-white p-5">
      <div class="col-md-8" v-if="transaction">
        <h3> Click checkout URL to complete your payment </h3>
        <div class="row mt-3">
          <div class="col-4 text-end">
            <span class="title"> Status: </span>
          </div>
          <div class="col-8">
            <span class="status_tag" :class="transaction.status"> {{transaction.status}} </span>
          </div>
        </div>
      
        <div class="row mt-3">
          <div class="col-4 text-end">
            <span class="title"> Amount: </span>
          </div>
          <div class="col-8">
            <span> {{transaction.amount}} </span>
          </div>
        </div>

        <div class="row mt-3">
          <div class="col-4 text-end">
            <span class="title"> Receive Currency: </span>
          </div>
          <div class="col-8">
            <span> {{transaction.currency}} </span>
          </div>
        </div>

        <div class="row mt-3">
          <div class="col-4 text-end">
            <span class="title"> Receive Address: </span>
          </div>
          <div class="col-8">
            <span> {{transaction.to}} </span>
          </div>
        </div>

        <div class="row mt-3">
          <div class="col-4 text-end">
            <span class="title"> Gateway Address: </span>
          </div>
          <div class="col-8">
            <span> {{transaction.gateway_address}} </span>
          </div>
        </div>

        <div class="row mt-3">
          <div class="col-4 text-end">
            <span class="title"> Buyer Email: </span>
          </div>
          <div class="col-8">
            <span> {{currentUser.email}} </span>
          </div>
        </div>

        <div class="row mt-3">
          <div class="col-4 text-end">
            <span class="title"> Txn ID </span>
          </div>
          <div class="col-8">
            <span> {{transaction.txn_id}} </span>
          </div>
        </div>

        <div class="row mt-3">
          <div class="col-4 text-end">
            <span class="title"> Status URL: </span>
          </div>
          <div class="col-8">
            <a v-if="transaction.status_url" :href="transaction.status_url" target="_blank">View payment status</a>
          </div>
        </div>

        <div class="row mt-3">
          <div class="col-4 text-end">
            <span class="title"> Checkout URL: </span>
          </div>
          <div class="col-8">
            <a  v-if="transaction.checkout_url" :href="transaction.checkout_url" target="_blank" >Complete your payment</a>
          </div>
        </div>
        
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';

export default {
  data: function () {
    return {
      message: "Hello Vue!",
      transaction_id: this.$route.params.id,
      transaction: null,
      error: '',
    }
  },

  mounted() {
    this.$http.get(`/api/coinpayments/transactions/${this.transaction_id}`)
      .then(response => {
        this.transaction = response.data.transaction;
      }).catch(error => {
        this.error = error.response;
    });
  },

  computed: {
    ...mapState(['currentUser']),
  }
}
</script>

<style scoped lang="scss">
.payment {
  .title {
    font-family: 'Poppins';
    font-weight: bold;
    font-size: 16px;
    line-height: 21px;
  }

  .content {
    @media only screen and (max-width: 575px) {
      padding: 30px 10px !important;

      .actions {
        .btn {
          font-size: 13px !important;
        }
      }
    }
  }
}
</style>
