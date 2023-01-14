require 'rails_helper'

  RSpec.describe "recipe request" do
    it 'returns recipes of a given country' do
      
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

    it 'will return an empty json object' do
      ex_response_body = {
        "data": []
      }
      country = ""

      get "/api/v1/recipes?country=#{country}"

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to be_a(Hash)
      expect(response_body).to have_key(:data)
      expect(response_body).to eq(ex_response_body)
      expect(response_body[:data].length).to eq(0)
      expect(response_body[:data].first).to eq(nil)
      expect(response_body[:data].count).to eq(0)
    end
  end