class TowJob < Tempjob
  has_many :tempjobresponses, foreign_key: 'tempjob_id'

  def say_response
    tow_type_response = tempjobresponses.where(response_type: 'tow_type').order(Arel.sql('random()')).first.response
    pick_up_location_response = tempjobresponses.where(response_type: 'location').order(Arel.sql('random()')).first.response
    car_response = tempjobresponses.where(response_type: 'car').order(Arel.sql('random()')).first.response
    "#{@name.name}, a tow truck was requested to pick up #{tow_type_response} #{car_response} from #{pick_up_location_response} you got paid #{@total_pay} potatoes"
  end

  def say_fail_response
    "#{@name.name} You turned up and the vehicle had already been towed you did not get paid for this job"
  end

  def job_successful
    a = [true, true, false, true, true, true, true, false].sample
    unless a
      @name.take_points(@total_pay)
      return say_fail_response
    end
    return false unless take_mayor_funds(@total_pay)
    @name.give_points(@total_pay)
    say_response
  end

  def attempt_job(name)
    @total_pay = total_pay
    @name = StreamElementsWrapper::Points.new(name)
    message = job_successful
    StreamElementsWrapper::Bot.new.message(message) if message
    true
  end
end
