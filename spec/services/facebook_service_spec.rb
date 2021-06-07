require 'rails_helper'

describe FacebookService do
  subject(:facebook) { described_class.new }

  describe '#scan_statuses' do
    context 'successful response' do
      before do
        stub_request(:get, FacebookService::BASE_URL).to_return(status: 200, body: response_body)
      end

      it 'parses the response' do
        expect(facebook.scan_statuses).to eq ["Here's some photos of my holiday"]
      end
    end

    context 'error response' do
      before do
        stub_request(:get, FacebookService::BASE_URL).to_return(status: 200, body: nil)
      end

      it 'parses the response' do
        expect(facebook.scan_statuses).to eq ['Error retrieving statuses']
      end
    end
  end

  def response_body
    "[{\"name\":\"Some Friend\",\"status\":\"Here's some photos of my holiday\"}]"
  end
end