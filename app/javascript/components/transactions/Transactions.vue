<template>
  <div class="transactions p-3">
    <div class="col-md-10">
      <div class="rounded shadow bg-white p-4">
        <div class="row justify-content-between">
          <div class="col-md-6">
            <span class="title mt-3"> Transaction History </span>
          </div>
          <div class="actions col-md-6 text-end">
            <button class="sort-btn btn bg-white">
              <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M0.381315 2.64339L2.49051 0.500478C2.65527 0.333147 2.92253 0.333201 3.08718 0.500478L5.1963 2.64339C5.46184 2.91312 5.27274 3.37501 4.89794 3.37501H3.6327V11.9464C3.6327 12.1831 3.44381 12.375 3.21078 12.375H2.36694C2.1339 12.375 1.94501 12.1831 1.94501 11.9464V3.37501H0.679667C0.304129 3.37501 0.116321 2.91258 0.381315 2.64339ZM6.58616 2.0893H13.3369C13.57 2.0893 13.7588 1.89743 13.7588 1.66073V0.803584C13.7588 0.566879 13.57 0.375013 13.3369 0.375013H6.58616C6.35313 0.375013 6.16424 0.566879 6.16424 0.803584V1.66073C6.16424 1.89743 6.35313 2.0893 6.58616 2.0893ZM6.16424 5.08929V4.23215C6.16424 3.99545 6.35313 3.80358 6.58616 3.80358H11.6492C11.8823 3.80358 12.0712 3.99545 12.0712 4.23215V5.08929C12.0712 5.326 11.8823 5.51787 11.6492 5.51787H6.58616C6.35313 5.51787 6.16424 5.326 6.16424 5.08929ZM6.16424 11.9464V11.0893C6.16424 10.8526 6.35313 10.6607 6.58616 10.6607H8.27385C8.50689 10.6607 8.69578 10.8526 8.69578 11.0893V11.9464C8.69578 12.1831 8.50689 12.375 8.27385 12.375H6.58616C6.35313 12.375 6.16424 12.1831 6.16424 11.9464ZM6.16424 8.51786V7.66072C6.16424 7.42401 6.35313 7.23215 6.58616 7.23215H9.96154C10.1946 7.23215 10.3835 7.42401 10.3835 7.66072V8.51786C10.3835 8.75457 10.1946 8.94643 9.96154 8.94643H6.58616C6.35313 8.94643 6.16424 8.75457 6.16424 8.51786Z" fill="#C4C4C4"/>
              </svg>
              <span> Sort By </span>
            </button>

            <button class="filter-btn ms-3 btn bg-white">
              <svg width="12" height="13" viewBox="0 0 12 13" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M11.1567 0.375H0.670116C0.188266 0.375 -0.0548745 0.981234 0.286544 1.33526L4.46679 5.67049V10.5C4.46679 10.6835 4.55315 10.8555 4.69817 10.9608L6.50641 12.2729C6.86316 12.5318 7.35997 12.2694 7.35997 11.812V5.67049L11.5403 1.33526C11.881 0.981937 11.6396 0.375 11.1567 0.375Z" fill="#C4C4C4"/>
              </svg>
              <span> Filter </span>
            </button>
          </div>
        </div> <hr>

          <div class="row">
            <div class="col-md-2">Transaction Hash</div>
            <div class="col-md-2">Amount</div>
            <div class="col-md-2">Type</div>
            <div class="col-md-2">Status</div>
            <div class="col-md-2">Date</div>
            <div class="col-md-2">Action</div>
          </div>
        <hr>
        <div v-for="transaction in transactions">
          <div class="row">
            <div class="col-md-2 hash">
              <span>{{transaction.txn_hash}}</span>
            </div>
            <div class="col-md-2 amount">{{parseFloat(transaction.amount).toPrecision(8)}}  {{transaction.currency}}</div>
            <div class="col-md-2 action">{{transaction.action}}</div>
            <div class="col-md-2">
              <div class="status_tag" :class="transaction.status">{{transaction.status}} </div>
            </div>
            <div class="col-md-2 date">{{formatDate(transaction.created_at)}}</div>
            <div class="col-md-2 status">
              <a :href="transaction.status_url" target="_blank">View</a>
            </div>
          </div><hr>
        </div>

        <div class="pagination row align-items-center justify-content-end">
          <div class="col-xl-2 col-lg-3 col-6 text-end">
            <span> {{page * per_page + 1}}-{{page * per_page + transactions.length}} of {{total}} </span>
          </div>
          <div class="col-xl-2 col-lg-3 col-6 text-end">
            <button class="btn" :class="{ disabled : page == 0 }" @click="prevPage">
              <svg width="9" height="15" viewBox="0 0 9 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M7.62557 13.875L1.90615 7.94442C1.86879 7.90568 1.86879 7.84432 1.90615 7.80558L7.62557 1.875" stroke="#9FA2B4" stroke-width="2" stroke-linecap="round"/>
              </svg>
            </button>
            <button class="btn" :class="{ disabled : page == total_page - 1 }" @click="nextPage">
              <svg width="9" height="15" viewBox="0 0 9 15" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M1.55743 13.875L7.27686 7.94442C7.31422 7.90568 7.31421 7.84432 7.27686 7.80558L1.55743 1.875" stroke="#9FA2B4" stroke-width="2" stroke-linecap="round"/>
              </svg>
            </button>
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
      message: "Hello Vue!",
      transactions: [],
      total_page: 0,
      page: 0,
      per_page: 0,
      total: 0,
    }
  },

  methods: {
    formatDate(date){
      var d = new Date(date);
      var dd = d.getDate() >= 10 ? d.getDate() : '0' + d.getDate() ;
      var mm = d.getMonth() + 1;
      mm = mm >= 10 ? mm : '0' + mm;
      var yyyy = d.getFullYear();
      return `${dd}/${mm}/${yyyy}`;
    },

    nextPage() {
      if(this.page < this.total_page - 1)
        this.page ++;
    },

    prevPage() {
      if(this.page > 0)
        this.page --;
    },

    fetchTransaction() {
      this.$http.get(`/api/coinpayments/transactions`, { params: { page: this.page }})
        .then(response => {
          this.transactions = response.data.transactions;
          this.total_page = parseInt(response.data.total_page);
          this.per_page = parseInt(response.data.per_page);
          this.total = parseInt(response.data.total);
        }).catch(error => {
          this.error = error.response;
      });
    }
  },

  watch: {
    page: function(val) {
      this.fetchTransaction();
    }
  },

  mounted() {
    this.fetchTransaction();
  }
}
</script>

<style scoped lang="scss">
.transactions {
  .hash {
    overflow: hidden;
    text-overflow: ellipsis;
  }

  @media only screen and (max-width: 575px) {
    .actions {
        text-align: left !important;
    }
  }
}

</style>
