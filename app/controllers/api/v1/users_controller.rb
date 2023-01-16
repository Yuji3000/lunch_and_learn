class Api::V1::UsersController < ApplicationController
  def create
    # require 'pry'; binding.pry

    user = User.new(name: params[:name], email: params[:email], api_key: User.generate_api_key)
    # require 'pry'; binding.pry
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: { error: 'User not created'}, status: 404
    end
  end
end