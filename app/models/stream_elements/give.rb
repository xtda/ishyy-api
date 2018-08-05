module StreamElements
  class Give < StreamElements

    def initialize(from, to, amount)
      @from_name = StreamElementsWrapper::Points.new(parse_name(from))
      @to_name = StreamElementsWrapper::Points.new(parse_name(to))
      @to_points = @to_name.points
      @from_points = @from_name.points
      @amount = parse_amount(amount)
    end

    def give
      if @to_name.name.eql?(@from_name.name)
        StreamElementsWrapper::Bot.new.message("You can't give yourself potatoes #{@to_name.name}!")
        return "can't give yourself potatoes"
      end

      unless @to_points
        StreamElementsWrapper::Bot.new.message("User #{@to_name.name} not found #{@from_name.name}")
        return 'user not found'
      end

      unless @amount <= @from_points
        StreamElementsWrapper::Bot.new.message("You do not have enough potatoes to give #{@from_name.name}, You currently have #{@from_points} potatoes")
        return 'not enough potatoes'
      end

      unless @amount.positive?
        StreamElementsWrapper::Bot.new.message("You can't give less than 1 potato #{@from_name.name}!")
        return "can't give less than 1 potato"
      end

      if @to_points + @amount > 2_147_483_647
        StreamElementsWrapper::Bot.new.message("#{to_name.name} can't have more than 2,147,483,647 points #{@from_name.name}!")
        return 'over cap'
      end

      to_new_balance = @to_name.give_points(@amount)
      @from_name.take_points(@amount)
      return_message = "#{@from_name.name} gave #{@amount} potatoes to #{@to_name.name}!, their new balance is #{to_new_balance}!"
      StreamElementsWrapper::Bot.new.message(return_message)
      return_message
    end

    private

    def parse_amount(amount)
      return @from_points if amount.eql?('all')
      return amount.to_i * 1000 if amount[-1].casecmp?('k')
      amount.to_i
    end
  end
end
