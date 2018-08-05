module StreamElementsWrapper
  class Bot < StreamElementsClass
    def message(message)
      escaped_message = {
        "message": message
      }
      request = post_request("bot/#{channel_id}/say", escaped_message)
      return true if request
      false
    end
  end
end
