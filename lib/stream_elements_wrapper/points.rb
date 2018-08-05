module StreamElementsWrapper
  class Points < StreamElementsClass
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def give_points(points)
      update_points(points)
    end

    def take_points(points)
      update_points(-points)
    end

    def points
      current_points
    end

    private

    def current_points
      request = get_request("points/#{channel_id}/#{@name}")
      return request['points'] if request
      false
    end

    def update_points(points)
      request = put_request("points/#{channel_id}/#{@name}/#{points}")
      return request['newAmount'] if request
      false
    end
  end
end
