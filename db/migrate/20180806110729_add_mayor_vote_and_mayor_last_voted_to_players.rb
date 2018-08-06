class AddMayorVoteAndMayorLastVotedToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :mayor_vote, :string
    add_column :players, :mayor_last_voted, :datetime, default: 3.days.ago
  end
end
