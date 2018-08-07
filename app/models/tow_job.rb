class TowJob < Tempjob
  has_many :tempjobresponses, foreign_key: 'tempjob_id'
  
  def say_response(total_pay)
    puts "say response called on tow"
    tow_type_response = tempjobresponses.where(response_type: 'tow_type').order(Arel.sql('random()')).first.response
    pick_up_location_response = tempjobresponses.where(response_type: 'location').order(Arel.sql('random()')).first.response
    car_response = tempjobresponses.where(response_type: 'car').order(Arel.sql('random()')).first.response
    "A tow truck was requested to pick up #{tow_type_response} #{car_response} from #{pick_up_location_response} you got paid #{total_pay} potatoes"
  end

  def say_fail_response(total_pay)
    "The driver turned up and hit you over the head with a pipe and stole #{total_pay}"
  end

  def job_successful
    [true, true, true, true, true, true, true, true].sample
  end
end
