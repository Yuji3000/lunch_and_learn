require 'rails_helper'

RSpec.describe "user requests" do
  it 'can create a user' do
    post '/api/v1/users', as: :json, params: {
      "name": "Athena Dao",
      "email": "athenadao@bestgirlever.com"
    } 
    
    expect(response).to be_successful
    # SecureRandom.hex(64)
  end
end