class CreateTempjobresponses < ActiveRecord::Migration[5.2]
  def change
    create_table :tempjobresponses do |t|
      t.string :response_sign
      t.string :response_type
      t.text :response
      t.references :tempjob, foreign_key: true

      t.timestamps
    end
  end
end
