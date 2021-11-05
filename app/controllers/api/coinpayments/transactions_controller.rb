module Api
  module Coinpayments
    class TransactionsController < ApplicationController

      def create
        service = ::Coinpayments::ApiService.new(current_user)
        transaction = service.create_transaction(transaction_params)

        return render json: { message: service.error }, status: :unprocessable_entity unless service.success?

        render json: { transaction: transaction }, status: :ok
      end

      def show
        transaction = current_user.transactions.find_by(id: params[:id])
        render json: { transaction: transaction }, status: :ok
      end

      def index
        transactions = current_user.transactions.order(:created_at)
        render json: { transactions: transactions }, status: :ok
      end

      private

      def transaction_params
        params.require(:transaction)
              .permit(
                :amount,
                :currency,
                :address,
              )
      end
    end
  end
end
