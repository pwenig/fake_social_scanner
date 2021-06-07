# frozen_string_literal: true

class TwitterService
  include HTTParty
  BASE_URL = 'https://takehome.io/twitter'

  def scan_tweets
    response = HTTParty.get(BASE_URL)
    begin
      body = JSON.parse(response.body)
      body.map { |x| x['tweet'] }
    rescue StandardError
      ['Error retrieving tweets']
    end
  end
end
