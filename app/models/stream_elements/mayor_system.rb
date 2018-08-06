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
  
  end
end
