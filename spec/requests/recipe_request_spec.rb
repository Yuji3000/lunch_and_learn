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
        expect(response_body[:data].first).to have_key(:attributes)
        expect(response_body[:data][0][:attributes]).to have_key(:title)
        expect(response_body[:data][0][:attributes][:title]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
        expect(response_body[:data][0][:attributes]).to have_key(:url)
        expect(response_body[:data][0][:attributes]).to have_key(:country)
        expect(response_body[:data][0][:attributes][:country]).to eq("thailand")
        expect(response_body[:data][0][:attributes]).to have_key(:image)
      end
    end

    it 'will recipes from a random country' do
    
      country = nil

      get "/api/v1/recipes?country=#{country}"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to be_a(Hash)
      expect(response_body).to_not have_key(:to)
      expect(response_body).to_not have_key(:from)
      expect(response_body[:data].first).to have_key(:id)
      expect(response_body[:data].first).to have_key(:type)
      expect(response_body[:data].first).to have_key(:attributes)
      expect(response_body[:data][0][:attributes]).to have_key(:title)
      expect(response_body[:data][0][:attributes]).to have_key(:url)
      expect(response_body[:data][0][:attributes]).to have_key(:country)
      expect(response_body[:data][0][:attributes]).to have_key(:image)
 
    end
  end