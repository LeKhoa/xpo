
module Api
  module Shrimpy
    class AccountsController < ApplicationController

      def add_exchange_account
        service = ::Shrimpy::ClientService.new(current_user)
        service.add_exchange_account(params[:public_key], params[:private_key], params[:is_rebalancing])
        return render json: { message: service.error }, status: :unprocessable_entity unless service.success?

        get_exchange_accounts
      end

      def remove_exchange_account
        service = ::Shrimpy::ClientService.new(current_user)
        service.remove_exchange_account(params[:shrimpy_account_id])
        return render json: { message: service.error }, status: :unprocessable_entity unless service.success?

        get_exchange_accounts
      end

      def get_exchange_accounts
        rebalance_account = current_user.exchange_accounts.rebalancing.first
        account = current_user.exchange_accounts.normal.first
        render json: {
          account: account,
          rebalance_account: rebalance_account,
        }
      end

      private
    end
  end
end
