module StreamElements
  class JobSystem < StreamElements
    
    def initialize(player, job_code)
      @player ||= Player.find_or_create_by(name: parse_name(player))
      @job_code = job_code
    end

    def sign_on
      job = Tempjob.find_by(code: @job_code)
      return if @player.tempjob == job
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
      job = Tempjob.find_by(code: @job_code)
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
        return message
      end

      @player.tempjob.attempt_job(@player.name)
      time = rand(2...8)
      @player.temp_job_last_claimed = time.minutes.from_now
      @player.save
      'job passed'
    end
  end
end
