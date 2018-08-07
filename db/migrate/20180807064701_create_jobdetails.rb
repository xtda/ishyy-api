class CreateJobdetails < ActiveRecord::Migration[5.2]
  def change
    create_table :jobdetails do |t|
      t.references :player, foreign_key: true
      t.references :tempjob, foreign_key: true

      t.timestamps
    end
  end
end
