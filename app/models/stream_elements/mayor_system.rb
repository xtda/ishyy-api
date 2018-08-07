module StreamElements
  class MayorSystem < StreamElements

    def initialize(caller)
      @mayor = Mayor.first
      @caller = Player.find_or_create_by(name: parse_name(caller))
    end

    def current_mayor
      @mayor.current_mayor
    end

    def mayor?
      return true if @caller.name == current_mayor
      false
    end

    def say_current_mayor
      message = "The current mayor is: #{current_mayor}"
      StreamElementsWrapper::Bot.new.message(message)
      message
    end

    def check_current_vote_total(name)
      Player.where(mayor_last_voted: 1.day.ago..DateTime::Infinity.new, mayor_vote: name).count
    end

    def check_for_new_mayor(name)
      return false if name == current_mayor
      if check_current_vote_total(name) >= check_current_vote_total(current_mayor)
        @mayor.current_mayor = name
        @mayor.save!
        message = "The people have spoken! #{name} has been voted the new mayor! Long may they reign"
        StreamElementsWrapper::Bot.new.message(message)
        return true
      end
      false
    end

    def attempt_vote(vote)
      vote = StreamElementsWrapper::Points.new(parse_name(vote))
      vote_valid = vote.points
      unless vote_valid
        message = "User #{vote.name} not found #{voter}"
        StreamElementsWrapper::Bot.new.message(message)
        return message
      end
      add_vote = @caller.cast_vote(vote.name)
      return false unless add_vote
      message = "Your vote for #{vote.name} has been registered #{@caller.name}"
      StreamElementsWrapper::Bot.new.message(message)
      check_for_new_mayor(vote.name)
      message
    end

    def say_current_tax
      message = "Tax is currently set to #{@mayor.mayor_tax}%"
      StreamElementsWrapper::Bot.new.message(message)
      message
    end

    def update_tax(tax)
      return false unless mayor?
      unless tax.match?(/\d/)
        message = 'Numbers only!'
        StreamElementsWrapper::Bot.new.message(message)
        return false
      end
      if tax.to_i.negative? || tax.to_i > 99
        message = 'Tax can only be set between 0 & 99'
        StreamElementsWrapper::Bot.new.message(message)
        return false
      end
      @mayor.current_tax = tax.to_i
      return false unless @mayor.save
      message = "Tax set to #{@mayor.current_tax}%"
      StreamElementsWrapper::Bot.new.message(message)
      message
    end

    def say_current_funds
      message = "Current mayor budget: #{@mayor.current_funds} potatoes (Tax rate: #{@mayor.current_tax}%)"
      StreamElementsWrapper::Bot.new.message(message)
      message
    end

    def transfer_funds(to, amount)
      return false unless mayor?
      amount = parse_amount(amount)
      if amount.to_i <= 0
        message = "You can't give 0 potatoes"
        StreamElementsWrapper::Bot.new.message(message)
        return false
      end
      if amount.to_i > @mayor.current_funds
        message = 'Not enough potatoes in the mayor funds'
        StreamElementsWrapper::Bot.new.message(message)
        return false
      end
      to = StreamElementsWrapper::Points.new(parse_name(to))
      to_points = to.points
      unless to_points
        message = "User not found #{@mayor.current_mayor}"
        StreamElementsWrapper::Bot.new.message(message)
        return false
      end
      if to_points + amount > 2_147_483_647
        StreamElementsWrapper::Bot.new.message("#{to_name.name} can't have more than 2,147,483,647 potatoes!")
        return 'over cap'
      end
      to.give_points(amount)
      @mayor.current_funds -= amount.to_i
      return 'transfer failed' unless @mayor.save
      message = "The mayor gave #{to.name} #{amount} potatoes, The new balance is: #{@mayor.current_funds} potatoes"
      MayorAudit.log(current_mayor,
                     'TRANSFER',
                     "TRN-#{current_mayor}-#{SecureRandom.random_number(1..1_000_000_000)}",
                     "Transferred #{to.name} #{amount} potatoes")
      PlayerAudit.log(to.name, 'MAYORTRANSFER', "Received #{amount} potatoes from #{current_mayor}")
      StreamElementsWrapper::Bot.new.message(message)
      message
    end

    def job_bonus(job_code, bonus)
      return false unless mayor?
      unless bonus.to_i.positive?
        message = 'bonus must be a positive percent'
        StreamElementsWrapper::Bot.new.message(message)
        return true
      end
      attempt_set_bonus = JobSystem.new('xtda616', job_code).bonus(bonus.to_i)
      if attempt_set_bonus
        message = "The bonus for #{job_code} jobs has been set to #{bonus}%"
        StreamElementsWrapper::Bot.new.message(message)
        return true
      end
      false
    end

    def add_funds(amount)
      @mayor.current_funds += parse_amount(amount.to_s)
      return true if @mayor.save
      false
    end

    def take_funds(amount)
      return false unless parse_amount(amount.to_s) < @mayor.current_funds
      @mayor.current_funds -= parse_amount(amount.to_s)
      return true if @mayor.save
      false
    end

    def parse_amount(amount)
      return @mayor.current_funds if amount.eql?('all')
      return amount.to_i * 1000 if amount[-1].casecmp?('k')
      return amount.to_i * 1_000_000 if amount[-1].casecmp?('m')
      amount.to_i
    end
  end
end
