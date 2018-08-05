
module Api
  module V1
    module Streamelements
    # Retreive update to date realm list from armory
      class OverunderController < ApiController

        def update
          attempt_overunder = StreamElements::Overunder.new(params[:player],
                                                      params[:choice],
                                                      params[:amount]).new_game
          return success(attempt_overunder, 200) if attempt_overunder
          error!('overunder failed', 422)
        end
      end
    end
  end
end