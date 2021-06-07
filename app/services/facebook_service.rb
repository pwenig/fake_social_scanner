# frozen_string_literal: true

class FacebookService
  include HTTParty
  BASE_URL = 'https://takehome.io/facebook'

  def scan_statuses
    response = HTTParty.get(BASE_URL)

    begin
      body = JSON.parse(response.body)
      body.map { |x| x['status'] }
    rescue StandardError
      ['Error retrieving statuses']
    end
  end
end
