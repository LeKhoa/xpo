module Onramper
  class TransactionService < BaseService
    attr_reader :user
    GATEWAY = 'onramper'.freeze

    def initialize(user)
      @user = user
    end

    def create_or_update(params)
      payload = params[:payload]

      transaction = user.transactions.find_or_initialize_by(txn_id: payload[:txId])
      transaction.gateway = GATEWAY
      transaction.txn_hash = payload[:txId]
      transaction.amount = payload[:outAmount]
      transaction.to = payload[:wallet]
      transaction.source = payload[:inCurrency]
      transaction.currency = payload[:outCurrency]
      transaction.action = 'deposit'

      case params[:type]
      when 'transaction_pending'
        transaction.status = 'pending'
      when 'transaction_failed'
        transaction.status = 'failed'
      when 'transaction_completed'
        transaction.status = 'completed'
      else
      end
      transaction.save!
    rescue StandardError => e
      execute_error!(e)
    end
  end
end
