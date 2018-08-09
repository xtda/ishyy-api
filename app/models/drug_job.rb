class DrugJob < Tempjob
  has_many :tempjobresponses, foreign_key: 'tempjob_id'
  has_many :players, through: :jobdetail

  def say_response
    drug_type = tempjobresponses.where(response_sign: 'positive', response_type: 'drugs').order(Arel.sql('random()')).first.response
    "#{@name.name}, you sold #{@drugs_sold} #{drug_type} at #{@sold_price} and made #{@total_pay} potatoes"
  end

  def say_fail_response
    "#{@name.name}, you got caught selling drugs the cops took all your cash you lost #{@total_pay}"
  end

  def job_successful
    a = [false, true, false, true, false, true, true, false].sample
    unless a
      @name.take_points(@total_pay)
      return say_fail_response
    end
    take_mayor_funds(@total_pay)
    @name.give_points(@total_pay)
    say_response
  end

  def total_pay
    @drugs_sold * @sold_price
  end

  def attempt_job(name)
    @drugs_sold = rand(1...10)
    @sold_price = rand(25..250)
    @total_pay = total_pay
    @name = StreamElementsWrapper::Points.new(name)
    message = job_successful
    StreamElementsWrapper::Bot.new.message(message)
    true
  end
end
