class AddRemoveReferencesFromExchangeAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :exchange_accounts, :user, foreign_key: true
    add_reference :exchange_accounts, :shrimpy_user, foreign_key: true

    remove_column :users, :shrimpy_user_id, :string
  end
end
