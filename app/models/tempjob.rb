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

  def take_mayor_funds(total_pay)
    attempt_to_take_funds = StreamElements::MayorSystem.new('nil').take_funds(total_pay)
    unless attempt_to_take_funds
      message = "The town is broke you can't do anymore work!"
      StreamElementsWrapper::Bot.new.message(message)
      return false
    end
    true
  end
end
