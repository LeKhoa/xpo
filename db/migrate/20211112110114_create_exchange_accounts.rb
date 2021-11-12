class CreateExchangeAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :exchange_accounts do |t|
      t.string :exchange
      t.string :shrimpy_account_id
      t.string :public_key
      t.string :private_key
      t.string :status, default: "active"
      t.boolean :is_rebalancing, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
