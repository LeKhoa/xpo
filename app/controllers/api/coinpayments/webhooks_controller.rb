
module Api
  module Coinpayments
    class WebhooksController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        return render json: { error: 'Invalid merchant ID'}, status: :unauthorized if invalid_merchant?(params[:merchant])

        status = params[:status].to_i
        transaction = Transaction.find_by(txn_id: params[:txn_id])

        if status < 0
          transaction.cancel! if transaction.may_cancel?
        elsif status >= 100
          transaction.complete! if transaction.may_complete?
        else
          transaction.wait! if transaction.may_wait?
        end
      end


      private

      def invalid_merchant?(merchant_id)
        ENV['COINPAYMENT_MERCHANT_ID'] != merchant_id
      end
    end
  end
end
