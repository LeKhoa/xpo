class CreateStrategies < ActiveRecord::Migration[6.1]
  def change
    create_table :strategies do |t|
      t.jsonb :allocations
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
