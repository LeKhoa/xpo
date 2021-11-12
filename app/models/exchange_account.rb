class ExchangeAccount < ApplicationRecord
  belongs_to :user

  scope :active, ->{ where(status: 'active') }
  scope :rebalancing, ->{ where(is_rebalancing: true).active }
  scope :normal, ->{ where(is_rebalancing: false).active }
end
