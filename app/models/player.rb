class Player < ApplicationRecord
  has_one :jobdetail
  has_one :tempjob, through: :jobdetail

  def cast_vote(vote)
    return false if mayor_vote.eql?(vote) && mayor_last_voted > 1.day.ago
    self.mayor_vote = vote
    self.mayor_last_voted = Time.now
    save!
    true
  end
end
