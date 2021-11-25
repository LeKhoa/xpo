# frozen_string_literal: true

module Shrimpy
  class AccountService < BaseService
    attr_reader :account, :shrimpy_user

    def initialize(account)
      @account = account
      @shrimpy_user = account.shrimpy_user
    end

    def add_exchange_account
      response = ApiService.link_exchange_account(account.exchange, shrimpy_user.uuid, account.public_key, account.private_key)
      return response_error!(response.body) unless response.success?

      data = JSON.parse(response.body)
      account.update!(shrimpy_account_id: data['id'])
    rescue StandardError => e
      execute_error!(e)
    end

    def set_strategy(allocations)
      response = ApiService.set_strategy(shrimpy_user.uuid, account.shrimpy_account_id, allocations)
      return response_error!(response.body) unless response.success?

    rescue StandardError => e
      execute_error!(e)
    end

    def get_strategy
      response = ApiService.get_strategy(shrimpy_user.uuid, account.shrimpy_account_id)
      return response_error!(response.body) unless response.success?
      JSON.parse response.body
    rescue StandardError => e
      execute_error!(e)
    end

    def create_trade(from_symbol, to_symbol, amount)
      response = ApiService.create_trade(shrimpy_user.uuid, account.shrimpy_account_id, from_symbol, to_symbol, amount)
      return response_error!(response.body) unless response.success?
      JSON.parse response.body
    rescue StandardError => e
      execute_error!(e)
    end

    def get_trade(trade_id)
      response = ApiService.get_trade(shrimpy_user.uuid, account.shrimpy_account_id, trade_id)
      return response_error!(response.body) unless response.success?
      JSON.parse response.body
    rescue StandardError => e
      execute_error!(e)
    end

    def rebalance
      response = ApiService.rebalance(shrimpy_user.uuid, account.shrimpy_account_id)
      return response_error!(response.body) unless response.success?

    rescue StandardError => e
      execute_error!(e)
    end

    def get_balance
      response = ApiService.get_balance(shrimpy_user.uuid, account.shrimpy_account_id)
      return response_error!(response.body) unless response.success?
      JSON.parse(response.body)['balances']
    rescue StandardError => e
      execute_error!(e)
    end

    def get_rebalance_period
      response = ApiService.get_rebalance_period(shrimpy_user.uuid, account.shrimpy_account_id)
      return response_error!(response.body) unless response.success?
      JSON.parse(response.body)
    rescue StandardError => e
      execute_error!(e)
    end

    def remove_exchange_account
      response = ApiService.unlink_exchange_account(shrimpy_user.uuid, account.shrimpy_account_id)
      return response_error!(response.body) unless response.success?

      account.update!(status: 'inactive')
    rescue StandardError => e
      execute_error!(e)
    end

  end
end
