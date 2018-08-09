module Api
  module V1
    module Streamelements
      module MayorSystem
        class AddFundsController < ApiController

          def index
            funds = StreamElements::MayorSystem.new('nil').current_funds
            success(funds, 200)
          end

          def show
            StreamElements::MayorSystem.new('nil').say_current_funds
            success('okay', 200)
          end

          def update
            caller = params[:caller]
            amount = params[:amount]
            mayor = StreamElements::MayorSystem.new(caller).add_funds(amount)
            return success('added funds', 200) if mayor
            error!('add funds failed', 200)
          end
        end
      end
    end
  end
end