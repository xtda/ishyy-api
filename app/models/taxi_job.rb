class TaxiJob < Tempjob
  has_many :tempjobresponses, foreign_key: 'tempjob_id'
  has_many :players, through: :jobdetail

  def say_response
    number_response = tempjobresponses.where(response_sign: 'positive', response_type: 'number').order(Arel.sql('random()')).first.response
    locations = tempjobresponses.where(response_sign: 'positive', response_type: 'location').order(Arel.sql('random()')).limit(2)
    pick_up_location_response = locations.first.response
    drop_off_location_response = locations.second.response
    "#{@name.name}, you picked up #{number_response} from #{pick_up_location_response} and dropped them off at #{drop_off_location_response} you got paid #{@total_pay} potatoes"
  end

  def say_fail_response
    negative_response = tempjobresponses.where(response_sign: 'negative', response_type: 'negative').order(Arel.sql('random()')).first.response
    "#{@name.name}, #{negative_response} #{total_pay} potatoes"
  end

  def job_successful
    a = [true, true, false, true, true, true, true, false].sample
    unless a
      @name.take_points(@total_pay)
      return say_fail_response
    end
    take_mayor_funds(@total_pay)
    @name.give_points(@total_pay)
    say_response
  end

  def attempt_job(name)
    @total_pay = total_pay
    @name = StreamElementsWrapper::Points.new(name)
    message = job_successful
    StreamElementsWrapper::Bot.new.message(message)
    true
  end
end
