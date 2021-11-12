module Shrimpy
  class ClientService < BaseService
    attr_reader :user

    EXCHANGE = 'binance'

    def initialize(user)
      @user = user
    end

    def add_exchange_account(public_key, private_key, is_rebalancing)

      if user.shrimpy_user_id.blank?
        response = ApiService.create_user(user.name)
        return response_error!(response.body) unless response.success?

        data = JSON.parse(response.body)
        user.update(shrimpy_user_id: data['id'])
      end

      response = ApiService.link_exchange_account(EXCHANGE, user.reload.shrimpy_user_id, public_key, private_key)
      return response_error!(response.body) unless response.success?

      data = JSON.parse(response.body)
      user.exchange_accounts.create!(
        exchange: EXCHANGE,
        public_key: public_key,
        private_key: private_key,
        shrimpy_account_id: data['id'],
        is_rebalancing: is_rebalancing
      )

    rescue StandardError => e
      execute_error!(e)
    end

    def remove_exchange_account(shrimpy_account_id)
      response = ApiService.unlink_exchange_account(user.shrimpy_user_id, shrimpy_account_id)
      return response_error!(response.body) unless response.success?

      user.exchange_accounts.find_by(shrimpy_account_id: shrimpy_account_id)&.update!(status: 'inactive')
    rescue StandardError => e
      execute_error!(e)
    end

  end
end