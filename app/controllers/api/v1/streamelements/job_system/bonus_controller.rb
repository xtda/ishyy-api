module Api
  module V1
    module Streamelements
      module JobSystem
        class BonusController < ApiController
          def show
            StreamElements::JobSystem.new('xtda616', nil).show_bonus
            success('okay', 200)
          end
        end
      end
    end
  end
end
