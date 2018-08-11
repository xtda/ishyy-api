module StreamElements
  class Overunder < StreamElements
    def initialize(player, choice, amount)
      @player_name = StreamElementsWrapper::Points.new(parse_name(player))
      @player_points = @player_name.points
      @choice = choice
      @amount = parse_amount(amount)
      @dice = roll_dice
    end

    def new_game
      unless @amount.positive?
        message = "You can't bet less than 1 potato #{@player_name.name}!"
        StreamElementsWrapper::Bot.new.message(message)
        return message
      end

      unless @amount <= @player_points
        message = "You do not have enough potatoes to give #{@player_name.name}, You currently have #{@player_points} potatoes"
        StreamElementsWrapper::Bot.new.message(message)
        return message
      end

      if check_win
        win_amount = check_win_amount
        @player_name.give_points(win_amount - @amount)
        @message = "The dice rolled #{@dice[0]} and #{@dice[1]} (#{@choice}), Congratulations! #{@player_name.name}, you won #{win_amount} potatoes!"
        StreamElementsWrapper::Bot.new.message(@message)
        MayorSystem.new('nil').tax_win(@player_name.name, win_amount)
        PlayerAudit.log(@player_name.name, 'OVERUNDER', "Won #{win_amount} with a roll of #{@dice[0]} and #{@dice[1]} ")
      else
        @player_name.take_points(@amount)
        MayorSystem.new('nil').add_funds(@amount * 0.25)
        @message = "Better luck next time #{@player_name.name} the dice rolled #{@dice[0]} and #{@dice[1]} (#{check_over_under}) you lost #{@amount} potatoes" 
        StreamElementsWrapper::Bot.new.message(@message)
        PlayerAudit.log(@player_name.name, 'OVERUNDER', "Lost #{@amount} with a roll of #{@dice[0]} and #{@dice[1]}")
      end
      @message
    end

    private

    def roll_dice
      Array.new(2) { 1 + SecureRandom.random_number(6) }
    end

    def dice_total
      @dice.inject(0, :+)
    end

    def check_over_under
      total = dice_total
      return 'under' if total < 7
      return 'over' if total > 7
      return 'seven' if total == 7
    end

    def check_win
      @choice = 'seven' if @choice == '7'
      true if check_over_under == @choice
    end

    def check_win_amount
      return @amount * 4 if check_over_under.eql?('seven')
      @amount * 2
    end

    def parse_amount(amount)
      return @player_points if amount.eql?('all')
      return amount.to_i * 1000 if amount[-1].casecmp?('k')
      return amount.to_i * 1_000_000 if amount[-1].casecmp?('m')
      amount.to_i
    end
  end
end
