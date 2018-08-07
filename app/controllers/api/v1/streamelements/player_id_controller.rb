
module Api
  module V1
    module Streamelements
    # Retreive update to date realm list from armory
      class PlayerIdController < ApiController

        def show
          caller = params[:caller]
          show_id = StreamElements::PlayerInfo.new(caller).show_id
          return success('success', 200) if show_id
          error('failed', 422)
        end
      end
    end
  end
end