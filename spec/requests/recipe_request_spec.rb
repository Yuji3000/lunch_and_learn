require 'rails_helper'

  RSpec.describe "recipe request" do
    it 'returns recipes of a given country' do
      VCR.use_cassette('happy_thailand_recipe_request') do
        country = "thailand"

        get "/api/v1/recipes?country=#{country}"

        expect(response).to be_successful
        expect(response.status).to eq(200)
        
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body).to be_a(Hash)
        expect(response_body).to_not have_key(:to)
        expect(response_body).to_not have_key(:from)
        expect(response_body[:data].first).to have_key(:id)
        expect(response_body[:data].first).to have_key(:type)
        expect(response_body[:data][0][:type]).to_not eq("favorites")
        expect(response_body[:data].first).to have_key(:attributes)
        expect(response_body[:data][0][:attributes]).to have_key(:title)
        expect(response_body[:data][0][:attributes][:title]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
        expect(response_body[:data][0][:attributes]).to have_key(:url)
        expect(response_body[:data][0][:attributes]).to have_key(:country)
        expect(response_body[:data][0][:attributes][:country]).to eq("thailand")
        expect(response_body[:data][0][:attributes]).to have_key(:image)
        expect(response_body[:data][0][:attributes]).to_not have_key(:uri)
   
      end
    end

    it 'sad path does not return recipes' do
      VCR.use_cassette('find_recipe_bad_input') do
        country = "3232323asdfvasdfasdfasdfasdfasdfasdfasddfasdfasdf"

        get "/api/v1/recipes?country=#{country}"

        response_body = JSON.parse(response.body, symbolize_names: true)
        # require 'pry'; binding.pry

        expect(response_body).to have_key(:data)
        expect(response_body[:data].present?).to eq(false)

      end
    end
  end