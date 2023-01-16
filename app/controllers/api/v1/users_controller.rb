class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(name: params[:name], email: params[:email], api_key: User.generate_api_key)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: { error: 'User not created'}, status: 404
    end
  end
end