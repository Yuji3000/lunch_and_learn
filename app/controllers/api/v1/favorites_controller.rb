class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by_api_key(params[:api_key])
    if user == nil
      render json: { error: 'User not found, api key is invalid'}
    else
        favorite = user.favorites.new(country: params[:country], recipe_link: params[:recipe_link], recipe_title: params[:recipe_title])
      if favorite.save
        render json: { success: 'Favorite added successfully' } , status: 201
      end
    end
  end
end