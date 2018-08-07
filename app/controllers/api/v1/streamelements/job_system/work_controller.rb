module Api
  module V1
    module Streamelements
      module JobSystem
        class WorkController < ApiController

          def update
            job = StreamElements::JobSystem.new(params[:player],
                                                'nil').attempt_job
            return success('success', 200) if job
            error!('broken', 422)
          end
        end
      end
    end
  end
end