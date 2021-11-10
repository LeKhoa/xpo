module Api
  module Onramper
    class WebhooksController < ApplicationController
      skip_before_action :verify_authenticity_token
      skip_before_action :authenticate_user!

      SIGNATURE_HEADER_NAME = 'X-Onramper-Webhook-Signature'.freeze

      def create
        signature = request.headers[SIGNATURE_HEADER_NAME]

        return render json: { error: 'Invalid signature'}, status: :unauthorized unless valid_signature?(signature)

        user_id = params[:payload][:partnerContext][:userId]
        user = User.find_by(id: user_id)
        if user
          service = ::Onramper::TransactionService.new(user)
          service.create_or_update(params)
        end

        render json: { message: :success }, status: :ok
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

      def valid_signature?(header_signature)
        secret = ENV['ONRAMPER_SECRET']
        data = request.body.read
        header_signature == OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), secret, data)
      end
    end
  end
end
