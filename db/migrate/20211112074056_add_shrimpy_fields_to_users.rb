class AddShrimpyFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :shrimpy_user_id, :string
    add_column :users, :name, :string
  end
end
