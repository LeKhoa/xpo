class Strategy < ApplicationRecord
  default_scope { where(active: true) }

  validate :allocations_valid_for_symbol_percent

  after_save :update_shrimpy_strategy

  def allocations_valid_for_symbol_percent
    symbols = allocations.map { |asset| asset['symbol'] }
    return errors.add(:allocations, 'All symbols must be present') if symbols.any? { |symbol| symbol.blank? }

    total_percent = allocations.map { |asset| asset['percent'].to_d }.sum
    return errors.add(:allocations, 'Total percent must equal 100') if total_percent != 100
  end


  private

  # Set strategy for rebalancing exchange account
  def update_shrimpy_strategy
    account = ExchangeAccount.active.rebalancing.last
    service = Shrimpy::AccountService.new(account)
    service.set_strategy(allocations)
  end
end
