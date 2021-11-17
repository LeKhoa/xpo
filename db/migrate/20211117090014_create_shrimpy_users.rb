class CreateShrimpyUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :shrimpy_users do |t|
      t.string :name
      t.string :uuid
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
