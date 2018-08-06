class CreateMayors < ActiveRecord::Migration[5.2]
  def change
    create_table :mayors do |t|
      t.string :current_mayor, default: 'xtda616'
      t.integer :current_funds, limit: 8, default: 250_000
      t.integer :current_tax, limit: 2, default: 0

      t.timestamps
    end
  end
end
