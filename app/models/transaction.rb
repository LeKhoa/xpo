class Transaction < ApplicationRecord
  belongs_to :user

  ACTIONS = {
    deposit: 'deposit',
    withdraw: 'withdraw',
  }

  include AASM
  aasm column: :status do
    state :initialized, initial: true
    state :pending
    state :canceled
    state :failed
    state :completed

    event :cancel do
      transitions from: [:initialized, :pending], to: :canceled
    end

    event :fail do
      transitions from: [:initialized, :pending], to: :failed
    end

    event :complete, :after => :schedule_rebalance do
      transitions from: [:initialized, :pending], to: :completed
    end

    event :wait do
      transitions from: [:initialized], to: :pending
    end
  end

  def deposit?
    action == ACTIONS[:deposit]
  end

  # Rebalance account after 15 minutes
  def schedule_rebalance
    return unless deposit?

    account = ExchangeAccount.active.rebalancing.last
    return unless account

    RebalancerWorker.perform_in(15.minutes, account.id)
  end
end
