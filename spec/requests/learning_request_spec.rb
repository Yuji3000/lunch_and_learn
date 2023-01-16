require 'rails_helper'

  RSpec.describe "learning request" do
    it 'returns recipes of a given country' do
      VCR.use_cassette('learn_request_thailand') do
      
        country = "laos"

        get "/api/v1/learning_resources?country=#{country}"

        expect(response).to be_successful
        expect(response.status).to eq(200)
        
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body).to be_a(Hash)
        expect(response_body).to_not have_key(:to)
        expect(response_body).to_not have_key(:from)
        expect(response_body).to have_key(:data)
        expect(response_body[:data]).to have_key(:id)
        expect(response_body[:data][:id]).to eq(nil)
        expect(response_body[:data]).to have_key(:type)
        expect(response_body[:data][:type]).to eq("learning_resource")
        expect(response_body[:data][:attributes]).to have_key(:country)
        expect(response_body[:data][:attributes]).to have_key(:video)
        expect(response_body[:data][:attributes]).to have_key(:images)
      end
    end
  end