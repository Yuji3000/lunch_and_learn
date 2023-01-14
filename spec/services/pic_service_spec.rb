require 'rails_helper'

RSpec.describe PicService do
  it 'returns images when searching by country' do
    country = "laos"

    user1 = create(:user)
    # require 'pry'; binding.pry
    response = PicService.find_pics(country)

    expect(response[:photos][:photo].count).to eq(100)
    expect(response[:photos][:photo][0]).to have_key(:id)
    expect(response[:photos][:photo][0][:id]).to be_a(String)
    expect(response[:photos][:photo][0]).to have_key(:secret)
    expect(response[:photos][:photo][0][:secret]).to be_a(String)
    expect(response[:photos][:photo][0]).to have_key(:server)
    expect(response[:photos][:photo][0][:server]).to be_a(String)
  end
end