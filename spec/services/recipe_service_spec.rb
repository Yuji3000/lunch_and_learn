require 'rails_helper'

RSpec.describe RecipeService do
  it 'returns recipes from a given country' do
    VCR.use_cassette('thailand_recipes') do
      re_thai = File.read("spec/fixtures/thailand_recipes.json")
      parsed_thai = JSON.parse(re_thai, symbolize_names: true)
      
      country = "Thailand"

      response_body = RecipeService.get_recipes(country)
    
      expect(response_body[:count]).to eq(191)
      expect(response_body[:hits][0][:recipe][:label]).to be_a(String)
      expect(response_body[:hits][0][:recipe]).to have_key(:label)
      expect(response_body[:hits][0][:recipe]).to have_key(:url)
      expect(response_body[:hits][0][:recipe]).to have_key(:image)
    end
  end
end