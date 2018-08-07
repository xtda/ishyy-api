class AddMayorBonusToTempJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :tempjobs, :mayor_bonus, :integer, default: 0
  end
end
