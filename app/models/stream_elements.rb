module StreamElements
  class StreamElements
    include ActiveModel::Model
    include StreamElementsWrapper

    def parse_name(name)
      name.delete('@').downcase
    end
  end
end
