require 'rails_helper'

describe TwitterService do
  subject(:twitter) { described_class.new }

  describe '#scan_tweets' do 
    context 'successful response' do
      before do
        stub_request(:get, TwitterService::BASE_URL).to_return(status: 200, body: response_body)
      end

      it 'parses the response' do
        expect(twitter.scan_tweets).to eq ['If you live to be 100.']
      end
    end

    context 'error response' do
      before do
        stub_request(:get, TwitterService::BASE_URL).to_return(status: 200, body: nil)
      end

      it 'returns error message' do
        expect(twitter.scan_tweets).to eq ['Error retrieving tweets']
      end
    end
  end

  def response_body
    "[{\"username\":\"@GuyEndoreKaiser\",\"tweet\":\"If you live to be 100.\"}
   ]"
  end
end