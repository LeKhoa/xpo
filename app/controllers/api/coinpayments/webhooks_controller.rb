
module Api
  module Coinpayments
    class WebhooksController < ApplicationController
      skip_before_action :verify_authenticity_token
      skip_before_action :authenticate_user!

      def create
        case params[:ipn_type]
        when 'api'
          handle_api_transaction
        else
        end
        { status: :ok }
      end


      private

      def invalid_merchant?(merchant_id)
        ENV['COINPAYMENT_MERCHANT_ID'] != merchant_id
      end

      def valid_signature?(signature)
        secret = ENV['COINPAYMENT_SECRET_PHRASE']
        data = request.body.read
        signature == OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha512'), secret, data)
      end

      def handle_api_transaction
        return Rollbar.error('Invalid merchant ID') if invalid_merchant?(params[:merchant])

        signature = request.headers['HTTP_HMAC']
        return Rollbar.error('Invalid signature') unless valid_signature?(signature)

        status = params[:status].to_i
        transaction = Transaction.find_by(txn_id: params[:txn_id])
        return Rollbar.error("Can not find transaction with txn_id: #{params[:txn_id]}") unless transaction

        if status < 0
          transaction.cancel! if transaction.may_cancel?
        elsif status >= 100
          transaction.complete! if transaction.may_complete?
        else
          transaction.wait! if transaction.may_wait?
        end

      end

    end
  end
end
