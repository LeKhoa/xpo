module Coinpayments
  class ApiService < BaseService
    attr_reader :user

    GATEWAY = 'coinpayments'.freeze

    def initialize(user)
      @user = user
    end

    def create_transaction(params)
      transaction = Coinpayments.create_transaction(params[:amount].to_i, 'USD', params[:currency],
                                                    buyer_email: user.email,
                                                    address: params[:address])
      return response_error!(transaction) if !transaction.kind_of?(Hash) || !transaction.respond_to?(:address)
      transaction = create_internal_transaction!(transaction, params) if transaction.kind_of?(Hash) && transaction.respond_to?(:address)
    rescue StandardError => e
      execute_error!(e)
    end

    def get_deposit_address
    end

    private

    def create_internal_transaction!(transaction, params)
      user.transactions.create(
        gateway: GATEWAY,
        txn_id: transaction.txn_id,
        txn_hash: transaction.txn_id,
        amount: transaction.amount.to_f,
        to: params[:address],
        gateway_address: transaction.address,
        source: 'USD',
        currency: params[:currency],
        action: Transaction::ACTIONS[:deposit],
        checkout_url: transaction.checkout_url,
        status_url: transaction.status_url,
      )
    end
  end
end