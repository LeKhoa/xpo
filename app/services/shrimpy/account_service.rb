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

    def remove_exchange_account(shrimpy_account_id)
      response = ApiService.unlink_exchange_account(user.shrimpy_user_id, shrimpy_account_id)
      return response_error!(response.body) unless response.success?

    rescue StandardError => e
      execute_error!(e)
    end

  end
end