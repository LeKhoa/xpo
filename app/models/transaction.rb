class Transaction < ApplicationRecord
  belongs_to :user

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

    event :complete do
      transitions from: [:pending], to: :completed
    end

    event :wait do
      transitions from: [:initialized], to: :pending
    end
  end
end
