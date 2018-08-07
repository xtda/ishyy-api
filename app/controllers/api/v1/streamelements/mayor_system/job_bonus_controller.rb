module Api
  module V1
    module Streamelements
      module MayorSystem
        class JobBonusController < ApiController

          skip_before_action :authenticate_user

          def show
            #StreamElements::MayorSystem.new('nil').available_fund
            #success('okay', 200)
          end

          def update
            caller = params[:caller]
            job_code = params[:job]
            amount = params[:amount]
            mayor = StreamElements::MayorSystem.new(caller).job_bonus(job_code, amount)
            return success('bonus set', 200) if mayor
            error!('bonus failed', 200)
          end
        end
      end
    end
  end
end
