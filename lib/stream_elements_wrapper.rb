# frozen_string_literal: true

# Wrapper for StreamElements api
# https://dev.streamelements.com/#
module StreamElementsWrapper
  API_HOST = 'https://api.streamelements.com/kappa/v2'

  class StreamElementsClass
    include StreamElementsWrapper
  end

  def channel_id
    Rails.application.credentials[Rails.env.to_sym][:streamelements][:channel_id]
  end

  def jwt_token
    Rails.application.credentials[Rails.env.to_sym][:streamelements][:jwt]
  end

  def get_request(end_point)
    end_point = "#{API_HOST}/#{end_point}"

    request = Typhoeus::Request.new(
      end_point,
      method: :get,
      followlocation: true,
      accept_encoding: 'gzip'
    )
    request.on_complete do |response|
      if response.success?
        return JSON.parse(response.response_body)
      else
        return false
      end
    end
    request.run
  end

  def put_request(end_point)
    end_point = "#{API_HOST}/#{end_point}"
    request = Typhoeus::Request.new(
      end_point,
      method: :put,
      headers: { Authorization: "Bearer #{jwt_token}" },
      followlocation: true,
      accept_encoding: 'gzip'
    )
    request.on_complete do |response|
      if response.success?
        return JSON.parse(response.response_body)
      else
        return false
      end
    end
    request.run
  end

  def post_request(end_point, body)
    end_point = "#{API_HOST}/#{end_point}"
    request = Typhoeus::Request.new(
      end_point,
      method: :post,
      body: body,
      headers: { Authorization: "Bearer #{jwt_token}", ContentType: 'application/json' },
      followlocation: true,
      accept_encoding: 'gzip'
    )
    request.on_complete do |response|
      if response.success?
        return JSON.parse(response.response_body)
      else
        return false
      end
    end
    request.run
  end
end
