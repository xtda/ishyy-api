module Api
  module V1
    module Streamelements
      module JobSystem
        class SignOffController < ApiController

          def update

            job = StreamElements::JobSystem.new(params[:player],
                                                'nil').sign_off
            return success('signed off', 200) if job
            error('broken', 422)
          end
        end
      end
    end
  end
end