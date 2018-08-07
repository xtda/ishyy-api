class AddTempJobLastClaimedToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :temp_job_last_claimed, :datetime, default: 3.days.ago
  end
end
