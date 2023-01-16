require 'rails_helper'

RSpec.describe YoutubeService do
  it 'returns a response body with learning resources' do
    VCR.use_cassette('laos_video') do
      country = "laos"

      response_body = YoutubeService.get_video(country)

      expect(response_body[:items].count).to eq(1)
      expect(response_body[:items][0][:snippet][:title]).to be_a(String)
      expect(response_body[:items][0][:snippet]).to have_key(:title)
      expect(response_body[:items][0][:snippet][:channelId]).to be_a(String)
      expect(response_body[:items][0][:snippet]).to have_key(:channelId)
      expect(response_body[:items][0][:snippet][:channelTitle]).to be_a(String)
      expect(response_body[:items][0][:snippet][:channelTitle]).to eq("Mr History")
    end
  end
end