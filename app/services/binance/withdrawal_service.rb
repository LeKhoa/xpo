# frozen_string_literal: true

module Binance
  class WithdrawalService < BaseService

    MAXIMUM_DECIMAL_PLACE = 8
    attr_reader :account

    def initialize(account)
      @account = account
    end

    def execute(params)
      # Create trade to convert strategy into target currency
      service = Shrimpy::AccountService.new(account)
      balances = service.get_balance
      return error!(service.error) unless service.success?

      allocations = get_allocations

      trade_ids = []
      allocations.each do |allocation|
        symbol = allocation['symbol']
        next if symbol == params[:currency]

        balance = balances.select { |bl| bl['symbol'] == symbol }.first
        return error!("#{symbol} balance is not exist") unless balance

        usd_amount =  params[:amount].to_f * allocation['percent'].to_f / 100
        from_amount = (usd_amount * balance['nativeValue'].to_f) / balance['usdValue'].to_f

        trade_id = service.create_trade(symbol, params[:currency], from_amount.round(MAXIMUM_DECIMAL_PLACE))
        return error!(serice.error) unless service.success?

        trade_ids << trade_id
      end

      error = get_trades_error(trade_ids)
      return error!(error) if error.present?

      # WithdrawalWorker.perform_in(5.minutes, trade_ids, params.to_json)
      withdraw!(params)
    end

    def withdraw!(params)
      Binance::Api::Account.withdraw!(
        coin: params[:currency],
        network: params[:network],
        amount: params[:amount],
        address: params[:address]
      )
    rescue StandardError => e
      execute_error!(e)
    end

    private

    def get_trades_error(trade_ids)
      service = Shrimpy::AccountService.new(account)
      trade_ids.each do |trade_id|
        trade = service.get_trade(trade_id)['trade']

        return service.error unless service.success?
  
        success = trade['status'] == 'completed' && trade['success']
        return trade unless success
      end
    end

    def get_allocations
      service = Shrimpy::AccountService.new(account)
      service.get_strategy['allocations']
    end
  end
end
