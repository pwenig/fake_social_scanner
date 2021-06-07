require 'rails_helper'

describe 'SocialScans', type: :request do
  context 'successful response' do
    before do
      stub_request(:get, TwitterService::BASE_URL).to_return(status: 200, body: twitter_response_body)
      stub_request(:get, FacebookService::BASE_URL).to_return(status: 200, body: facebook_response_body)
    end

    it 'returns social scans' do
      get social_scans_path
      expect(response).to have_http_status :ok
      tweet = 'If you live to be 100.'
      status = "Here's some photos of my holiday"
      result = JSON.parse(response.body)
      expect(result).to eq({"twitter"=> [tweet], "facebook"=> [status]})
    end
  end

  context 'error response' do
    before do
      stub_request(:get, TwitterService::BASE_URL).to_return(status: 200, body: twitter_response_body)
      stub_request(:get, FacebookService::BASE_URL).to_return(status: 200, body: nil)
    end

    it 'returns social scans with error message' do
      get social_scans_path
      expect(response).to have_http_status :ok
      tweet = 'If you live to be 100.'
      status = "Here's some photos of my holiday"
      result = JSON.parse(response.body)
      expect(result).to eq({"twitter"=> [tweet], "facebook"=> ["Error retrieving statuses"]})
    end
  end

  def twitter_response_body
    "[{\"username\":\"@GuyEndoreKaiser\",\"tweet\":\"If you live to be 100.\"}
   ]"
  end

  def facebook_response_body
    "[{\"name\":\"Some Friend\",\"status\":\"Here's some photos of my holiday\"}]"
  end
end