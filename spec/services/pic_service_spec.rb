require 'rails_helper'

RSpec.describe PicService do
  it 'returns images when searching by country' do
    country = "laos"
    
    response = PicService.find_pics(country)

    expect(response[:results].count).to eq(10)
    expect(response[:results][0][:urls]).to have_key(:raw)
    expect(response[:results][0]).to have_key(:description)
  end
end