require 'rails_helper'

  RSpec.describe "recipe request" do
    it 'returns recipes of a given country' do
      country = "thailand"

      get "/api/v1/recipes?country=#{country}"

      # require 'pry'; binding.pry
      # expect(response).to be_successful
      # expect(response.status).to eq(200)
      
      # response_body = JSON.parse(response.body, symbolize_names: true)

    end
  end