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

  it 'can get a users favorites' do
    user = create(:user, api_key: "12")
    fav1 = user.favorites.create!(country: "Thailand", recipe_link: "www.goog.com/yum_yum_noodles", recipe_title: "Yum Yum Noodles")
    fav2 = user.favorites.create!(country: "Thailand", recipe_link: "www.goog.com/papaya_salad", recipe_title: "Papaya Salad")

    get "/api/v1/favorites?api_key=#{user.api_key}"
     
   
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to have_key(:data)
    expect(response_body[:data]).to be_a(Array)
    expect(response_body[:data][0]).to have_key(:id)
    expect(response_body[:data][0]).to have_key(:type)
    expect(response_body[:data][0][:type]).to eq("favorite")
    expect(response_body[:data][0]).to have_key(:attributes)
    expect(response_body[:data][0][:attributes]).to have_key(:recipe_title)
    expect(response_body[:data][0][:attributes]).to have_key(:recipe_link)
    expect(response_body[:data][0][:attributes]).to have_key(:country)
    expect(response_body[:data][0][:attributes]).to have_key(:created_at)
  end

  it 'sad path no user found' do
    user = create(:user, api_key: "12")

    get "/api/v1/favorites?api_key=54545454545454"
     
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(404)
    expect(response_body[:error]).to eq('User not found, api key is invalid')
  end
end