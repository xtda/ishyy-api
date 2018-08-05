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

#PLAYER | XTDA616 | OVERUNDER | WIN BALANCED INCREASED BY 500 POTATOES  

#MAYOR | XTDA616 | TRANSFER | GAVE ISHYY 5000 POTATOES 
#type | name | method | details

#xtda616 | fine | fined 6000 potatoes for speeding by trooper fizz