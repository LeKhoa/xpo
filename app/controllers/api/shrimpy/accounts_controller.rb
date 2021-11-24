
module Api
  module Shrimpy
    class AccountsController < ApplicationController

      def add_exchange_account
        service = ::Shrimpy::AccountService.new(current_user)
        service.add_exchange_account(params[:public_key], params[:private_key], params[:is_rebalancing])
        return render json: { message: service.error }, status: :unprocessable_entity unless service.success?

        get_exchange_accounts
      end

      def remove_exchange_account
        service = ::Shrimpy::AccountService.new(current_user)
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

      def get_rebalancing_balance
        account = ExchangeAccount.active.rebalancing.last
        return render json: { message: 'Account is not exist' }, status: :not_found unless account

        service = ::Shrimpy::AccountService.new(account)
        balances = service.get_balance
        return render json: { message: service.error }, status: :unprocessable_entity unless service.success?

        render json: {
          balances: balances,
        }
      end


      def withdraw
        amount = params[:amount]
        currency = params[:currency]
        to_address = params[:to_address]
        network = params[:network]

        account = ExchangeAccount.rebalancing.last
        service = Binance::WithdrawalValidationService.new(account)
        validation = service.execute
        return render json: { message: service.error }, status: :unprocessable_entity unless service.success?

        service = Binance::WithdrawalService.new(account)
        trade_ids = service.execute(params)

        return render json: { message: service.error }, status: :unprocessable_entity unless service.success?

        render json: {
          trade_ids: trade_ids,
        }
      end
    end
  end
end
