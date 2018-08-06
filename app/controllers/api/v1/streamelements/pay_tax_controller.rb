
module Api
  module V1
    module Streamelements
    # Retreive update to date realm list from armory
      class PayTaxController < ApiController

        def update
          caller = params[:caller]
          amount = params[:amount]
          pay_tax = StreamElements::Tax.new(caller, amount).pay_tax
          return success('tax paid', 200) if pay_tax
          error('paytax failed', 422)
        end
      end
    end
  end
end