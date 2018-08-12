module Api
  module V1
    module Streamelements
    # Retreive update to date realm list from armory
      class WeatherController < ApiController

        def show
          attempt_weather = StreamElements::Weather.new(params[:location]).parse_weather
          return success(attempt_weather, 200) if attempt_weather
          error!('weather failed', 422)
        end
      end
    end
  end
end
