require 'rails_helper'

RSpec.describe "add favorites requests" do
  it 'can add a favorite to a user' do
    user = create(:user, api_key: "12")

    post '/api/v1/favorites', as: :json, params: {
      "api_key": "#{user.api_key}",
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

  it 'will not create a favorite when api key is empty' do
    post '/api/v1/favorites', as: :json, params: {
      "api_key": "",
      "country": "thailand",
      "recipe_link": "https://www.tastingtable.com/.....",
      "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
    } 
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to have_key(:error)
    expect(response_body[:error]).to eq('User not found, api key is invalid')
  end

  it 'will not create a favorite when api key is invalid' do
    post '/api/v1/favorites', as: :json, params: {
      "api_key": "000_+=@",
      "country": "thailand",
      "recipe_link": "https://www.tastingtable.com/.....",
      "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
    } 
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to have_key(:error)
    expect(response_body[:error]).to eq('User not found, api key is invalid')
  end
end