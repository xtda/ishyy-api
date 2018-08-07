module Api
  module V1
    module Streamelements
      module JobSystem
        class SignOnController < ApiController

          def update

            job = StreamElements::JobSystem.new(params[:player],
                                                params[:job]).sign_on
            success('signed on', 200)
          end
        end
      end
    end
  end
end