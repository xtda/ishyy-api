module Api
  module V1
    module Streamelements
    # Retreive update to date realm list from armory
      class GiveController < ApiController
        
        def update
          attempt_give = StreamElements::Give.new(params[:from],
                                                  params[:to],
                                                  params[:amount]).give
          return success(attempt_give, 200) if attempt_give
          error!('give funds failed', 422)
        end
      end
    end
  end
end
