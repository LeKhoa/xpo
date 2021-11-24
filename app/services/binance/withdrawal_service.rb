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

        trade_id = service.create_trate(symbol, params[:currency], from_amount.round(MAXIMUM_DECIMAL_PLACE))
        return error!(serice.error) unless service.success?

        trade_ids << trade_id
      end
      trade_ids
    end

    private

    def get_allocations
      service = Shrimpy::AccountService.new(account)
      service.get_strategy['allocations']
    end
  end
end
