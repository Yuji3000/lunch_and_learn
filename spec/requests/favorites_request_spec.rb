require 'rails_helper'

RSpec.describe "add favorites requests" do
  it 'can add a favorite to a user' do
    post '/api/v1/favorites', as: :json, params: {
      "api_key": "jgn983hy48thw9begh98h4539h4",
      "country": "thailand",
      "recipe_link": "https://www.tastingtable.com/.....",
      "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
  } 
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(response_body).to have_key(:success)
    expect(response_body[:success]).to eq("Favorite added successfully")
  end
end