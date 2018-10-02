module StreamElements
  class Weather < StreamElements
    def initialize(location)
      @location = location
    end

    def parse_weather
      api_key = Rails.application.credentials[Rails.env.to_sym][:owm]
      host = "http://api.openweathermap.org/data/2.5/weather?units=metric&appid=#{api_key}&q=#{@location}"
      data = get_request(host)

      message = "Weather for #{data['name']} (#{data['sys']['country']}) is #{data['main']['temp']} C (#{c_to_f(data['main']['temp'])} F), with a humidity of #{data['main']['humidity']}%"
      StreamElementsWrapper::Bot.new.message(message)
      true
    end

    private

    def c_to_f(temp)
      (temp.to_i * 9 / 5) + 32
    end

    def get_request(end_point)

      request = Typhoeus::Request.new(
        end_point,
        method: :get,
        followlocation: true,
        accept_encoding: 'gzip'
      )
      request.on_complete do |response|
        if response.success?
          return JSON.parse(response.response_body)
        else
          return false
        end
      end
      request.run
    end
  end
end
