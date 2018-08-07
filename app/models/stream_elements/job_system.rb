module StreamElements
  class JobSystem < StreamElements
    
    def initialize(player, job_code)
      @player ||= Player.find_or_create_by(name: parse_name(player))
      @player_streamelements = StreamElementsWrapper::Points.new(@player.name)
      @job_code = job_code
      #@mayor = Mayor.first
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

    def attempt_job
      return false unless @player.tempjob
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
      @player.temp_job_last_claimed = Time.now
      @player.save
      StreamElementsWrapper::Bot.new.message(message)
      'job passed'
    end
  end
end
