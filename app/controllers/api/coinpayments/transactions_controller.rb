module Api
  module Coinpayments
    class TransactionsController < ApplicationController
      PER_PAGE = 5

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
        page = (params[:page] || 0).to_i
        user_transactions = current_user.transactions
        total_page = (user_transactions.count.to_f / PER_PAGE).ceil

        transactions = user_transactions.order(created_at: :desc).limit(PER_PAGE).offset(page * PER_PAGE)
        render json: { transactions: transactions, total: user_transactions.count, total_page: total_page, per_page: PER_PAGE }, status: :ok
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
