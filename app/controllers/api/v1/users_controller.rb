class Api::V1::UsersController < ApplicationController
  def create
    require 'pry'; binding.pry
    key = SecureRandom.hex(64)
    require 'pry'; binding.pry
    User.new(user_params)
  end

  private 

  def user_params
    params.require(:user).require(:data).permit(:name, :email, :api_key)
  end
end