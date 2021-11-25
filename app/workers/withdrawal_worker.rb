# app/workers/rebalancer_worker.rb

class WithdrawalWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3

  sidekiq_retry_in do |count, exception|
    180 # Retry after 3 minutes
  end

  def perform(trade_ids, params)
    account = ExchangeAccount.active.rebalancing.last
    service = Shrimpy::AccountService.new(account)

    trade_ids.each do |trade_id|
      trade = service.get_trade(trade_id)['trade']
      if !service.success?
        Rollbar.error(service.error)
        raise service.error
      end

      success = trade['status'] == 'completed' && trade['success']
      if !success
        Rollbar.error("Trade #{trade_id} error, status: #{trade['status']}, success: #{trade['success'}")
        raise 'Trade error'
      end
    end

    params = JSON.parse(params).with_indifferent_access
    service = Binance::WithdrawalService.new(account)
    service.withdraw(params)
    success_log!('WithdrawalWorker completed successfull') if service.success?
  end

  def success_log!(message)
    if Rails.env.production?
      Rollbar.info(message)
    else
      puts message
    end
  end
end
