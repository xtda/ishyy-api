module Api
  module V1
    module Streamelements
      module MayorSystem
        class TakeFundsController < ApiController
          def update
            caller = params[:caller]
            amount = params[:amount]
            mayor = StreamElements::MayorSystem.new(caller).take_funds(amount)
            return success('take funds', 200) if mayor
            error!('take funds failed', 200)
          end
        end
      end
    end
  end
end