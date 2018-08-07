class TaxiJob < Tempjob
  has_many :tempjobresponses, foreign_key: 'tempjob_id'
  
  def say_response(total_pay)
    number_response = tempjobresponses.where(response_type: "number").order(Arel.sql('random()')).first.response
    pick_up_location_response = tempjobresponses.where(response_type: "location").order(Arel.sql('random()')).first.response
    tempjobresponses.connection.clear_query_cache
    drop_off_location_response = tempjobresponses.where(response_type: "location").order(Arel.sql('random()')).first.response
    "You picked up #{number_response} from #{pick_up_location_response} and dropped them off at #{drop_off_location_response} you got paid #{total_pay} potatoes"
  end

  def say_fail_response(total_pay)
    "You were robbed by your passanger and lost #{total_pay} potatoes"
  end

  def job_successful
    [true, true, true, true, true, false, false, false].sample
  end
end
