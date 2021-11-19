# app/workers/rebalancer_worker.rb

class RebalancerWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(exchange_account_id)
    account = ExchangeAccount.find_by(id: exchange_account_id)
    service = Shrimpy::AccountService.new(account)
    service.rebalance

    if Rails.env.production?
      Rollbar.info("RebalancerWorker completed successfull on account #{account.shrimpy_account_id}") if service.success?
    else
      puts "RebalancerWorker completed successfull on account #{account.shrimpy_account_id}" if service.success?
    end
  end
end
