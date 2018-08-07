module StreamElements
  class PlayerInfo < StreamElements

    def initialize(caller)
      @caller = Player.find_or_create_by(name: parse_name(caller)) 
      @caller_streamelements = StreamElementsWrapper::Points.new(parse_name(caller))
    end

    def show_id
      message = "Name: #{@caller.name}, potatoes: #{@caller_streamelements.points}, voted for: #{@caller.mayor_vote}, signed on as: #{@caller.tempjob.title}"
      StreamElementsWrapper::Bot.new.message(message)
      message
    end
  end
end