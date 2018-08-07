class Tempjob < ApplicationRecord
  has_many :jobdetail
  has_many :players, through: :jobdetail
  has_many :tempjobresponses

  def total_pay
    pay = base_pay
    mayor_bonus = (mayor_bonus.to_f / 100)
    bonus_pay = (pay * mayor_bonus).to_i
    pay + bonus_pay + rand(0..500)
  end
end