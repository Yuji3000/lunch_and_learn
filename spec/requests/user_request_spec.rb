require 'rails_helper'

RSpec.describe "user requests" do
  it 'can create a user' do
    post '/api/v1/users', as: :json, params: {
      "name": "Athena Dao",
      "email": "athenadao@bestgirlever.com"
    } 
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(response_body).to have_key(:data)
    expect(response_body[:data]).to have_key(:id)
    expect(response_body[:data]).to have_key(:type)
    expect(response_body[:data]).to have_key(:attributes)
    expect(response_body[:data][:attributes]).to have_key(:name)
    expect(response_body[:data][:attributes]).to have_key(:email)
    expect(response_body[:data][:attributes]).to have_key(:api_key)
  end
end