# frozen_string_literal: true

module Binance
  class WithdrawalValidationService < BaseService

    MINIMUM_BALANCE_IN_USD = 10
    SLIPPAGE = 2

    attr_reader :account, :shrimpy_user, :allocations

    def initialize(account)
      @account = account
      @shrimpy_user = account.shrimpy_user
      @allocations = get_allocations
    end


    def execute
      return error!('Allocations is not set') unless allocations

      service = Shrimpy::AccountService.new(account)
      balances = service.get_balance
      return error!(service.error) unless service.success?

      validate_to_usd_balance(balances)
    end

    private

    def validate_to_usd_balance(balances)
      allocations.each do |allocation|
        balance = balances.select { |bl| bl['symbol'] ==  allocation['symbol'] }.first
        return error!("#{allocation['symbol']} balance is not exist") unless balance

        to_usd_balance = balance['usdValue']
        return error!("#{allocation['symbol']} balance is too small, required atleast #{MINIMUM_BALANCE_IN_USD + SLIPPAGE} USD") if to_usd_balance * allocation['percent'].to_f/100  < (MINIMUM_BALANCE_IN_USD + SLIPPAGE)
      end
    end

    def get_allocations
      Strategy.first&.allocations
    end
  end
end
