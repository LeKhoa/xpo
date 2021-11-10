module Api
  module Onramper
    class WebhooksController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        return render json: { error: 'Invalid merchant ID'}, status: :unauthorized if invalid_merchant?(params[:merchant])

      end


      def partner_context
        render json: {
          context: {
            user_id: current_user.id,
            id: session[:partner_context_id] ||= Devise.friendly_token,
          }
        }
      end

      private

      def decode_signature(signature)
      end

      def invalid_secret?
        ENV['COINPAYMENT_MERCHANT_ID']
      end
    end
  end
end
