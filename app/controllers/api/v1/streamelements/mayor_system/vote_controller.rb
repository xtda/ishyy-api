
module Api
  module V1
    module Streamelements
      module MayorSystem
        class VoteController < ApiController
          
          def update
            caller = params[:caller]
            vote = params[:vote]
            mayor = StreamElements::MayorSystem.new(caller).attempt_vote(caller, vote)
            return success('voted', 200) if mayor
            error!('vote failed', 422)
          end
        end
      end
    end
  end
end