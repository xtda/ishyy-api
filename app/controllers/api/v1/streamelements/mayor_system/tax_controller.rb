module Api
  module V1
    module Streamelements
      module MayorSystem
        class TaxController < ApiController

          def show
            mayor = StreamElements::MayorSystem.new('nil').say_current_tax
            return success('success', 200) if mayor
            error!('failed', 422)
          end

          def update
            caller = params[:caller]
            tax = params[:tax]
            mayor = StreamElements::MayorSystem.new(caller).update_tax(tax)
            return success('success', 200) if mayor
            error!('failed', 422)
          end
        end
      end
    end
  end
end