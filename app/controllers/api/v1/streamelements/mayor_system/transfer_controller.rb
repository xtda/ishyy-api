module Api
  module V1
    module Streamelements
      module MayorSystem
        class TransferController < ApiController

          def update
            caller = params[:caller]
            to = params[:to]
            amount = params[:amount]
            mayor = StreamElements::MayorSystem.new(caller).transfer_funds(to, amount)
            return success('transferred funds', 200) if mayor
            error!('transfer funds failed', 200)
          end
        end
      end
    end
  end
end