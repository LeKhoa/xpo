class ExchangeAccount < ApplicationRecord
  default_scope { where(status: 'active') }

  STATUS = {
    active: 'active',
    inactive: 'inactive',
  }

  EXCHANGES = {
    binance: 'binance',
  }

  belongs_to :shrimpy_user

  scope :active, ->{ where(status: 'active') }
  scope :rebalancing, ->{ where(is_rebalancing: true) }
  scope :normal, ->{ where(is_rebalancing: false) }

  after_create :add_shrimpy_exchange_account, if: :shrimpy_account_is_not_exist?

  private

  def shrimpy_account_is_not_exist?
    shrimpy_account_id.blank?
  end

  def add_shrimpy_exchange_account
    service = Shrimpy::AccountService.new(self)
    service.add_exchange_account

    update!(status: 'inactive') unless service.success?
  end
end
