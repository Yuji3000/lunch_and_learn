require 'rails_helper'

RSpec.describe CountryService do
  it "can return data" do
    # VCR.use_cassette('random_country') do
    response = CountryService.random_country
    expect(response).to be_a(Array)
    expect(response[0]).to have_key(:name)
    expect(response[0][:name]).to have_key(:common)
    expect(response[0][:name][:common]).to be_a(String)
    expect(response[0][:name]).to be_a(Hash)
    # end
  end
end