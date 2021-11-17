<template>
  <div class="profile px-3">
    <div class="content rounded shadow bg-white">
      <div v-if="error" class="text-danger text-center pt-5"> {{error}} </div>
      <div v-if="msg" class="text-success pt-5 fw-bold text-center"> {{msg}} </div>
      <div class="row">
        <div class="col-md-8 col-xl-6 p-5">
          <div class="border rounded p-3 h-100">
            <div class="title mt-3"> {{currentUser.email}} </div>

            <div class="input-group mt-3">
              <span class="input-group-text" id="basic-addon1">
                <svg width="12" height="13" viewBox="0 0 12 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M6 2.35657C6.825 2.35657 7.5 3.03157 7.5 3.85657C7.5 4.68157 6.825 5.35657 6 5.35657C5.175 5.35657 4.5 4.68157 4.5 3.85657C4.5 3.03157 5.175 2.35657 6 2.35657ZM6 9.85657C8.025 9.85657 10.35 10.8241 10.5 11.3566H1.5C1.6725 10.8166 3.9825 9.85657 6 9.85657ZM6 0.856567C4.3425 0.856567 3 2.19907 3 3.85657C3 5.51407 4.3425 6.85657 6 6.85657C7.6575 6.85657 9 5.51407 9 3.85657C9 2.19907 7.6575 0.856567 6 0.856567ZM6 8.35657C3.9975 8.35657 0 9.36157 0 11.3566V12.8566H12V11.3566C12 9.36157 8.0025 8.35657 6 8.35657Z" fill="#A9A9A9"/>
                </svg>
              </span>
              <input v-model="name" type="text" placeholder="John Doe" class="form-control">
            </div>

            <div class="input-group mt-3">
              <span class="input-group-text" id="basic-addon2">
                <svg width="12" height="10" viewBox="0 0 12 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 1.25164C12 0.591636 11.46 0.0516357 10.8 0.0516357H1.2C0.54 0.0516357 0 0.591636 0 1.25164V8.45164C0 9.11164 0.54 9.65164 1.2 9.65164H10.8C11.46 9.65164 12 9.11164 12 8.45164V1.25164ZM10.8 1.25164L6 4.25164L1.2 1.25164H10.8ZM10.8 8.45164H1.2V2.45164L6 5.45164L10.8 2.45164V8.45164Z" fill="#A9A9A9"/>
                </svg>
              </span>
              <input v-model="email" type="text" placeholder="loremipsum@lorum.ipsum" class="form-control">
            </div>

            <div class="input-group mt-3">
              <span class="input-group-text" id="basic-addon3">
                <svg width="12" height="17" viewBox="0 0 12 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M10.5 5.74792H9.75V4.24792C9.75 2.17792 8.07 0.497925 6 0.497925C3.93 0.497925 2.25 2.17792 2.25 4.24792V5.74792H1.5C0.675 5.74792 0 6.42292 0 7.24792V14.7479C0 15.5729 0.675 16.2479 1.5 16.2479H10.5C11.325 16.2479 12 15.5729 12 14.7479V7.24792C12 6.42292 11.325 5.74792 10.5 5.74792ZM3.75 4.24792C3.75 3.00292 4.755 1.99792 6 1.99792C7.245 1.99792 8.25 3.00292 8.25 4.24792V5.74792H3.75V4.24792ZM10.5 14.7479H1.5V7.24792H10.5V14.7479ZM6 12.4979C6.825 12.4979 7.5 11.8229 7.5 10.9979C7.5 10.1729 6.825 9.49792 6 9.49792C5.175 9.49792 4.5 10.1729 4.5 10.9979C4.5 11.8229 5.175 12.4979 6 12.4979Z" fill="#A9A9A9"/>
                </svg>
              </span>
              <input v-model="password" type="password" placeholder="************" class="form-control">
            </div>

            <div class="input-group mt-3">
              <span class="input-group-text" id="basic-addon4">
                <svg width="12" height="17" viewBox="0 0 12 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M10.5 5.74792H9.75V4.24792C9.75 2.17792 8.07 0.497925 6 0.497925C3.93 0.497925 2.25 2.17792 2.25 4.24792V5.74792H1.5C0.675 5.74792 0 6.42292 0 7.24792V14.7479C0 15.5729 0.675 16.2479 1.5 16.2479H10.5C11.325 16.2479 12 15.5729 12 14.7479V7.24792C12 6.42292 11.325 5.74792 10.5 5.74792ZM3.75 4.24792C3.75 3.00292 4.755 1.99792 6 1.99792C7.245 1.99792 8.25 3.00292 8.25 4.24792V5.74792H3.75V4.24792ZM10.5 14.7479H1.5V7.24792H10.5V14.7479ZM6 12.4979C6.825 12.4979 7.5 11.8229 7.5 10.9979C7.5 10.1729 6.825 9.49792 6 9.49792C5.175 9.49792 4.5 10.1729 4.5 10.9979C4.5 11.8229 5.175 12.4979 6 12.4979Z" fill="#A9A9A9"/>
                </svg>
              </span>
              <input v-model="passwordConfirmation" type="password" placeholder="************" class="form-control">
            </div>

            <div class="row actions mt-5">
              <div class="col-5 col-xl-3">
                <button class="btn btn-md bg-purple text-white w-100" @click="updateProfile"> UPDATE </button>
              </div>
            </div>
          </div>
        </div>

        <!--
        <div class="col-md-8 col-xl-6 p-5 ps-0">
          <div class="border rounded p-3 h-100">
            <div class="account-1 mt-3">
              <div class="row">
                <div class="col-md-3">
                  <span class="fw-bold"> Shrimpy ID: </span>
                </div>

                <div class="col-md-9">
                  <span class="fw-bold"> {{currentUser.shrimpy_user_id}} </span>
                </div>
              </div>
              <h5 class="fw-bold mt-5" > Rebalancing Account </h5>
              <div v-if="rebalanceAccount">
                <div class="row mt-3">
                  <div class="col-md-3">
                    <span>Account ID: </span>
                  </div>
                  <div class="col-md-9">
                    <span>{{rebalanceAccount.shrimpy_account_id}}</span>
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col-md-3">
                    <span>Public key: </span>
                  </div>
                  <div class="col-md-9 key">
                    <span>{{rebalanceAccount.public_key}}</span>
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col-md-3">
                    <span>Private key: </span>
                  </div>
                  <div class="col-md-9 key">
                    <span>{{rebalanceAccount.private_key}}</span>
                  </div>
                </div>
                <div class="row justify-content-center actions mt-4">
                  <div class="col-5 col-xl-5">
                    <button class="btn btn-md bg-purple text-white w-100" @click="removeAccount(true)"> Remove Account </button>
                  </div>
                </div>
              </div>
              <div v-else>
                <div class="input-group mt-3">
                  <span class="input-group-text" id="basic-addon5">
                    <svg width="12" height="17" viewBox="0 0 12 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M10.5 5.74792H9.75V4.24792C9.75 2.17792 8.07 0.497925 6 0.497925C3.93 0.497925 2.25 2.17792 2.25 4.24792V5.74792H1.5C0.675 5.74792 0 6.42292 0 7.24792V14.7479C0 15.5729 0.675 16.2479 1.5 16.2479H10.5C11.325 16.2479 12 15.5729 12 14.7479V7.24792C12 6.42292 11.325 5.74792 10.5 5.74792ZM3.75 4.24792C3.75 3.00292 4.755 1.99792 6 1.99792C7.245 1.99792 8.25 3.00292 8.25 4.24792V5.74792H3.75V4.24792ZM10.5 14.7479H1.5V7.24792H10.5V14.7479ZM6 12.4979C6.825 12.4979 7.5 11.8229 7.5 10.9979C7.5 10.1729 6.825 9.49792 6 9.49792C5.175 9.49792 4.5 10.1729 4.5 10.9979C4.5 11.8229 5.175 12.4979 6 12.4979Z" fill="#A9A9A9"/>
                    </svg>
                  </span>
                  <input v-model="rebalancePublicKey" type="text" placeholder="API Key" class="form-control">
                </div>

                <div class="input-group mt-3">
                  <span class="input-group-text" id="basic-addon5">
                    <svg width="12" height="17" viewBox="0 0 12 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M10.5 5.74792H9.75V4.24792C9.75 2.17792 8.07 0.497925 6 0.497925C3.93 0.497925 2.25 2.17792 2.25 4.24792V5.74792H1.5C0.675 5.74792 0 6.42292 0 7.24792V14.7479C0 15.5729 0.675 16.2479 1.5 16.2479H10.5C11.325 16.2479 12 15.5729 12 14.7479V7.24792C12 6.42292 11.325 5.74792 10.5 5.74792ZM3.75 4.24792C3.75 3.00292 4.755 1.99792 6 1.99792C7.245 1.99792 8.25 3.00292 8.25 4.24792V5.74792H3.75V4.24792ZM10.5 14.7479H1.5V7.24792H10.5V14.7479ZM6 12.4979C6.825 12.4979 7.5 11.8229 7.5 10.9979C7.5 10.1729 6.825 9.49792 6 9.49792C5.175 9.49792 4.5 10.1729 4.5 10.9979C4.5 11.8229 5.175 12.4979 6 12.4979Z" fill="#A9A9A9"/>
                    </svg>
                  </span>
                  <input v-model="rebalancePrivateKey" type="text" placeholder="Private Key" class="form-control">
                </div>

                <div class="row justify-content-center actions mt-4">
                  <div class="col-5 col-xl-5">
                    <button class="btn btn-md bg-purple text-white w-100" @click="addAccount(true)"> Add Account </button>
                  </div>
                </div>
              </div>
            </div>

            <div class="account-2 mt-5">
            <h5 class="fw-bold mt-3"> Root Account </h5>
            <div v-if="account">
                <div class="row mt-3">
                  <div class="col-md-3">
                    <span>Account ID: </span>
                  </div>
                  <div class="col-md-9">
                    <span>{{account.shrimpy_account_id}}</span>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-3">
                    <span>Public key: </span>
                  </div>
                  <div class="col-md-9 key">
                    <span>{{account.public_key}}</span>
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col-md-3">
                    <span>Private key: </span>
                  </div>
                  <div class="col-md-9 key">
                    <span>{{account.private_key}}</span>
                  </div>
                </div>
              </div>
              <div v-else>
                <div class="input-group mt-3">
                  <span class="input-group-text" id="basic-addon5">
                    <svg width="12" height="17" viewBox="0 0 12 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M10.5 5.74792H9.75V4.24792C9.75 2.17792 8.07 0.497925 6 0.497925C3.93 0.497925 2.25 2.17792 2.25 4.24792V5.74792H1.5C0.675 5.74792 0 6.42292 0 7.24792V14.7479C0 15.5729 0.675 16.2479 1.5 16.2479H10.5C11.325 16.2479 12 15.5729 12 14.7479V7.24792C12 6.42292 11.325 5.74792 10.5 5.74792ZM3.75 4.24792C3.75 3.00292 4.755 1.99792 6 1.99792C7.245 1.99792 8.25 3.00292 8.25 4.24792V5.74792H3.75V4.24792ZM10.5 14.7479H1.5V7.24792H10.5V14.7479ZM6 12.4979C6.825 12.4979 7.5 11.8229 7.5 10.9979C7.5 10.1729 6.825 9.49792 6 9.49792C5.175 9.49792 4.5 10.1729 4.5 10.9979C4.5 11.8229 5.175 12.4979 6 12.4979Z" fill="#A9A9A9"/>
                    </svg>
                  </span>
                  <input v-model="publicKey" type="text" placeholder="API Key" class="form-control">
                </div>

                <div class="input-group mt-3">
                  <span class="input-group-text" id="basic-addon5">
                    <svg width="12" height="17" viewBox="0 0 12 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M10.5 5.74792H9.75V4.24792C9.75 2.17792 8.07 0.497925 6 0.497925C3.93 0.497925 2.25 2.17792 2.25 4.24792V5.74792H1.5C0.675 5.74792 0 6.42292 0 7.24792V14.7479C0 15.5729 0.675 16.2479 1.5 16.2479H10.5C11.325 16.2479 12 15.5729 12 14.7479V7.24792C12 6.42292 11.325 5.74792 10.5 5.74792ZM3.75 4.24792C3.75 3.00292 4.755 1.99792 6 1.99792C7.245 1.99792 8.25 3.00292 8.25 4.24792V5.74792H3.75V4.24792ZM10.5 14.7479H1.5V7.24792H10.5V14.7479ZM6 12.4979C6.825 12.4979 7.5 11.8229 7.5 10.9979C7.5 10.1729 6.825 9.49792 6 9.49792C5.175 9.49792 4.5 10.1729 4.5 10.9979C4.5 11.8229 5.175 12.4979 6 12.4979Z" fill="#A9A9A9"/>
                    </svg>
                  </span>
                  <input v-model="privateKey" type="text" placeholder="Private Key" class="form-control">
                </div>

                <div class="row justify-content-center actions my-4">
                  <div class="col-5 col-xl-5">
                    <button class="btn btn-md bg-purple text-white w-100" @click="addAccount(false)"> Add Account </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        -->
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'

export default {
  data: function () {
    return {
      message: "Hello Vue!",
      error: '',
      msg: '',
      name: '',
      email: '',
      password: '',
      passwordConfirmation: '',

      publicKey: '',
      privateKey: '',
      account: null,

      rebalancePublicKey: '',
      rebalancePrivateKey: '',
      rebalanceAccount: null,
    }
  },

  methods: {
    ...mapActions(['setCurrentUser']),

    updateProfile(e) {
      e.preventDefault();
      this.clearError();

      let formData = new FormData();
      formData.append('user[name]', this.name);
      formData.append('user[email]', this.email);
      formData.append('user[password]', this.password);
      formData.append('user[password_confirmation]', this.passwordConfirmation);

      this.$http.put(`/api/users/${this.currentUser.id}`, formData)
        .then(response => {
          this.msg = 'Update account successfull';
          this.updateAccountSuccessfull(response)
        }).catch(error => {
          this.error = error.response.data.message;
      });
    },

    updateAccountSuccessfull(response) {
      this.setCurrentUser(response.data.user)
      this.setUserData();
    },

    setUserData() {
      this.name = this.currentUser.name;
      this.email = this.currentUser.email;
    },

    clearError() {
      this.error = '';
      this.msg = '';
    },

    removeAccount(isRebalancing) {
      let params;
      if(isRebalancing) {
        params = {
          shrimpy_account_id: this.rebalanceAccount.shrimpy_account_id,
        }
      } else {
        params = {
          shrimpy_account_id: this.account.shrimpy_account_id,
        }
      }
      
      this.$http.delete(`/api/shrimpy/remove_exchange_account`, { data: params })
        .then(response => {
          this.msg = 'Remove account successfull';
          this.account = response.data.account;
          this.rebalanceAccount = response.data.rebalance_account;
        }).catch(error => {
          this.error = error.response.data.message;
      });
    },

    addAccount(isRebalancing) {
      let params;
      if(isRebalancing) {
        params = this.rebalanceAccountParams();
      } else {
        params = this.normalAccountParams();
      }

      this.$http.post(`/api/shrimpy/add_exchange_account`, params)
        .then(response => {
          this.msg = 'Add exchange account successfull';
          this.account = response.data.account;
          this.rebalanceAccount = response.data.rebalance_account;
        }).catch(error => {
          this.error = error.response.data.message;
      });
    },

    normalAccountParams(){
      return {
        public_key: this.publicKey,
        private_key: this.privateKey,
      }
    },

    rebalanceAccountParams() {
      return {
        public_key: this.rebalancePublicKey,
        private_key: this.rebalancePrivateKey,
        is_rebalancing: true,
      }
    },

    getUserAccounts() {
      this.$http.post('/api/shrimpy/get_exchange_accounts')
        .then(response => {
          this.account = response.data.account;
          this.rebalanceAccount = response.data.rebalance_account;
        }).catch(error => {
          this.error = error.response.data.message;
      });
    }

  },

  computed: {
    ...mapState(['currentUser']),
  },

  mounted() {
    this.setUserData();
    this.getUserAccounts();
  }
}
</script>

<style scoped lang="scss">
.profile {
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

  .key {
    overflow: hidden;
    text-overflow: ellipsis;
  }
}
</style>
