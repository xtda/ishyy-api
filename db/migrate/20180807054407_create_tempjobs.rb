class CreateTempjobs < ActiveRecord::Migration[5.2]
  def change
    create_table :tempjobs do |t|
      t.string :type
      t.string :code
      t.string :title
      t.integer :base_pay
      t.integer :limit

      t.timestamps
    end
    add_index :tempjobs, :code, unique: true
  end
end
