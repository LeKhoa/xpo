<template>
  <div class="payment">
    <div class="row m-0 p-3">
      <div class="cards col-md-8 ps-0 pe-2">
        <div class="content h-100 rounded shadow bg-white p-4">
          <label> Payment Selection </label>
          <div class="mt-3 border rounded p-3">
            <div class="col-md-9">
              <div class="row align-items-end">
                <div class="col-md-6 col-7">
                  <svg width="19" height="18" viewBox="0 0 19 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M9.5 18.0004C14.4706 18.0004 18.5 13.9709 18.5 9.00037C18.5 4.0298 14.4706 0.000366211 9.5 0.000366211C4.52944 0.000366211 0.5 4.0298 0.5 9.00037C0.5 13.9709 4.52944 18.0004 9.5 18.0004Z" fill="white"/>
                  <path d="M9.5 17.0004C13.9183 17.0004 17.5 13.4186 17.5 9.00037C17.5 4.58209 13.9183 1.00037 9.5 1.00037C5.08172 1.00037 1.5 4.58209 1.5 9.00037C1.5 13.4186 5.08172 17.0004 9.5 17.0004Z" stroke="#848484" stroke-width="2" stroke-miterlimit="10"/>
                  <path d="M9.5 13.0004C11.7091 13.0004 13.5 11.2095 13.5 9.00037C13.5 6.79123 11.7091 5.00037 9.5 5.00037C7.29086 5.00037 5.5 6.79123 5.5 9.00037C5.5 11.2095 7.29086 13.0004 9.5 13.0004Z" fill="#848484"/>
                  </svg>
                  <span class="ms-2 title"> Credit Card  </span>
                </div>
                <div class="col-md-6 col-5 text-end">
                  <img :src="cardsImg" class="w-50 brand">
                </div>
              </div>
            </div>
            <p class="mt-2 ps-4"> Safe money transfer using your bank account. Visa, Maestro, Discover, American Express.</p>

            <div class="mt-5 col-md-12 col-xl-9">
              <span class="mt-5 card-item"> CARD NUMBER </span>
              <input type="text" placeholder="0000 0000 0000 0000" class="form-control">

              <div class="row">
                <div class="col-md-6 mt-3 card-item">
                  <div> NAME ON CARD</div>
                  <input type="text" class="form-control">
                </div>
                <div class="col-md-3 col-6 mt-3 card-item">
                  <div> EXPIRY DATE</div>
                  <input type="text" placeholder="MM / YY" class="form-control">
                </div>
                <div class="col-md-3 col-6 mt-3 card-item">
                  <div> CVV CODE</div>
                  <input type="text" class="form-control">
                </div>
              </div>
            </div>
          </div>

          <div class="mt-3 border rounded p-3">
            <div class="col-md-6"> 
              <svg width="19" height="20" viewBox="0 0 19 20" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M9.5 19.0005C14.4706 19.0005 18.5 14.9711 18.5 10.0005C18.5 5.02993 14.4706 1.00049 9.5 1.00049C4.52944 1.00049 0.5 5.02993 0.5 10.0005C0.5 14.9711 4.52944 19.0005 9.5 19.0005Z" fill="white" stroke="#D4D9DD" stroke-miterlimit="10"/>
              </svg>
              <span class="ms-2 title"> Crypto  </span>
            </div>
            <p class="mt-2 ps-3"> You will be redirected to the Fiat website to complete your purchase securely.</p>
          </div>


          <div class="row actions mt-3">
            <div class="back col-sm-7 col-12 mt-3">
              <button class="btn btn-md bg-white text-start"> 
                <svg width="15" height="13" viewBox="0 0 15 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M2 6.50085H14" stroke="#788995" stroke-miterlimit="10" stroke-linecap="square"/>
                <path d="M1 6.50086L6.523 0.977859" stroke="#788995" stroke-miterlimit="10" stroke-linecap="square"/>
                <path d="M1 6.50085L6.523 12.0239" stroke="#788995" stroke-miterlimit="10" stroke-linecap="square"/>
                </svg>
                <span class="back-title"> Back to Customer Info </span>
              </button>
            </div>
            <div class="complete col-sm-5 col-12 text-end mt-3">
              <button class="btn btn-md bg-purple text-white"> Complete Order </button>
            </div>
          </div>
        </div>
      </div>

      <div class="cart col-md-4 ps-2 pe-0">
        <div class="rounded shadow p-4 bg-white h-100">
          <div class="row mb-3">
            <span> Cart </span> 
          </div>
          <hr>

          <div class="row align-items-center">
            <div class="col-md-3 col-sm-2 col-3">
              <img :src="btcImg" class="w-100">
            </div>
            <div class="col-md-9 col-8 text">
              <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae vel odio egestas.</p>
              <div> € 99.90</div>
            </div>
          </div>

          <div class="row mt-4 align-items-center">
            <div class="col-md-3 col-sm-2 col-3">
              <img :src="ethImg" class="w-100">
            </div>
            <div class="col-md-9 col-8 text">
              <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae vel odio egestas.</p>
              <div> € 99.90</div>
            </div>
          </div>
          <hr>

          <div class="row mt-3">
            <div class="col-md-6"> Have a Voucher?</div>
            <div class="col-md-6 text-end">
              <svg width="13" height="8" viewBox="0 0 13 8" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M6.74995 6.98467L12.2729 1.46167" stroke="#1B2125" stroke-miterlimit="10" stroke-linecap="square"/>
              <path d="M6.75 6.98467L1.227 1.46167" stroke="#1B2125" stroke-miterlimit="10" stroke-linecap="square"/>
              </svg> 
            </div>
          </div>
          <hr>

          <div class="row mt-3 item">
            <div class="col-md-6 col-6">Subtotal</div>
            <div class="col-md-6 col-6 text-end"> € 169.80 </div>
          </div>

          <div class="row mt-3 item">
            <div class="col-md-6 col-6">Shipping</div>
            <div class="col-md-6 col-6 text-end"> Free </div>
          </div>
          <hr>

          <div class="row mt-4">
            <div class="col-md-6 col-6">Total</div>
            <div class="col-md-6 col-6 text-end"> € 169.80 </div>
          </div>       
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import cardsImg from 'images/cards.png'
import btcImg from 'images/btc.png'
import ethImg from 'images/eth.png'

export default {
  data() {
    return {
      cardsImg: cardsImg,
      btcImg: btcImg,
      ethImg: ethImg,
    }
  }
}
</script>

<style scoped lang="scss">
.payment {
  .cards {
    @media only screen and (max-width: 767px) {
      padding-right: 0 !important;

      .content {
        padding: 30px 20px !important;
      }
    }

    @media only screen and (max-width: 575px) {
      .brand {
        width: 100% !important;
      }

      p {
        font-size: 12px !important;
      }
      .title {
        font-size: 12px !important;
      }

      .actions {
        .complete, .back {
          text-align: center !important;

          .btn {
            font-size: 15px;
          }
        }
      }
    }
  }

  .cart {
    @media only screen and (max-width: 767px) {
      padding-left: 0 !important;
      margin-top: 20px;
    }

    @media only screen and (max-width: 575px) {
      span {
        font-size: 12px;
      }
    }
  }
}
</style>
