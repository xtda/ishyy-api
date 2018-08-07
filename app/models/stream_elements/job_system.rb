module StreamElements
  class JobSystem < StreamElements
    
    def initialize(player, job_code)
      @player ||= Player.find_or_create_by(name: parse_name(player))
      @player_streamelements = StreamElementsWrapper::Points.new(@player.name)
      @job_code = job_code
    end

    def sign_on
      job = Tempjob.find_by(code: @job_code)
      return if @player.tempjob
      return unless job
      @player.tempjob = job
      message = "You have signed on as a #{job.title} #{@player.name}"
      StreamElementsWrapper::Bot.new.message(message)
      message
    end

    def sign_off
      @player.tempjob = nil
      message = "You have signed off work #{@player.name}"
      StreamElementsWrapper::Bot.new.message(message)
      message
    end

    def bonus(bonus)
      job = Job.find_by(code: @job_code)
      job.mayor_bonus = bonus
      return true if job.save
      false
    end

    def show_bonus
      message = ''
      a = Tempjob.all.pluck(:code, :mayor_bonus)
      a.each do |job, bonus|
        message += "Job: #{job} #{bonus} | "
      end
      message = message[0...-3]
      StreamElementsWrapper::Bot.new.message(message)
      message
    end

    def attempt_job
      return false unless @player.tempjob
      unless @player.temp_job_last_claimed < Time.now
        time_until = ((@player.temp_job_last_claimed - Time.now) / 60).to_i
        message = "You can't work for another #{time_until} minutes #{@player.name}"
        StreamElementsWrapper::Bot.new.message(message)
        return false
      end

      total_pay = @player.tempjob.total_pay

      unless @player.tempjob.job_successful
        message = @player.tempjob.say_fail_response(total_pay)
        @player_streamelements.take_points(total_pay)
        StreamElementsWrapper::Bot.new.message(message)
        @player.temp_job_last_claimed = Time.now
        @player.save
        return 'job failed'
      end
      attempt_to_take_funds = MayorSystem.new('nil').take_funds(total_pay)
      unless attempt_to_take_funds
        message = "The town is broke you can't do anymore work!"
        StreamElementsWrapper::Bot.new.message(message)
        return false
      end
      message = @player.tempjob.say_response(total_pay)
      @player_streamelements.give_points(total_pay)
      time = rand(4...10)
      @player.temp_job_last_claimed = time.minutes.from_now
      @player.save
      StreamElementsWrapper::Bot.new.message(message)
      'job passed'
    end
  end
end
