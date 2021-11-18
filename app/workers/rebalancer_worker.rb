# app/workers/rebalancer_worker.rb

class RebalancerWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(exchange_account_id)
    account = ExchangeAccount.find_by(id: exchange_account_id)
    service = Shrimpy::AccountService.new(account)
    service.rebalance
  end
end
