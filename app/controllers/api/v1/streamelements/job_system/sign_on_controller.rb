module Api
  module V1
    module Streamelements
      module JobSystem
        class SignOnController < ApiController

          def update

            job = StreamElements::JobSystem.new(params[:player],
                                                params[:job]).sign_on
            return success('signed on', 200) if job
            error('broken', 422)
          end
        end
      end
    end
  end
end