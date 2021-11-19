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
      transaction.action = Transaction::ACTIONS[:deposit]
      transaction.save!

      case params[:type]
      when 'transaction_pending'
        transaction.wait! if transaction.may_wait?
      when 'transaction_failed'
        transaction.fail! if transaction.may_fail?
      when 'transaction_completed'
        transaction.complete! if transaction.may_complete?
      else
      end
    rescue StandardError => e
      execute_error!(e)
    end
  end
end
