require 'rails_helper'

RSpec.describe LearningResourceService do
  it 'returns a response body with learning resources' do
    country = "laos"
    stub = File.read("spec/fixtures/yt_laos_search.json")
    parsed_stub = JSON.parse(stub, symbolize_names: true)

    response_body = LearningResourceService.get_video(country)

    expect(response_body[:items].count).to eq(5)
    expect(response_body[:items][0][:snippet][:title]).to be_a(String)
    expect(response_body[:items][0][:snippet]).to have_key(:title)
    expect(response_body[:items][0][:snippet][:channelId]).to be_a(String)
    expect(response_body[:items][0][:snippet]).to have_key(:channelId)
    expect(response_body[:items][0][:snippet][:channelTitle]).to be_a(String)
    expect(response_body[:items][0][:snippet][:channelTitle]).to eq("Mr History")
  end
end