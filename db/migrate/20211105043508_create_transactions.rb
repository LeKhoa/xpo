class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :gateway
      t.string :status
      t.string :txn_id
      t.string :txn_hash
      t.float :amount
      t.string :from
      t.string :to
      t.string :gateway_address
      t.string :source
      t.string :currency
      t.string :action
      t.string :checkout_url
      t.string :status_url

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
