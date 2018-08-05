module Api
  module V1
    class ApiController < ApplicationController
      protected

      def error!(message, status)
        render json: { error: message }, status: status
      end

      def success(message, status)
        render json: { success: message }, status: status
      end

      def unauthorized!
        error!('Unauthorized', 401)
      end

      def forbidden!
        error!('forbidden', 403)
      end
    end
  end
end
