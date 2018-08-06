module Api
  module V1
    module Streamelements
      module MayorSystem
        class CurrentController < ApiController
          
          def index
            StreamElements::MayorSystem.new('nil').say_current_mayor
            success('okay', 200)
          end

          def show
            mayor = StreamElements::MayorSystem.new('nil').current_mayor
            success(mayor, 200)
          end
        end
      end
    end
  end
end