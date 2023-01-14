class Api::V1::RecipesController < ApplicationController
  
  def index
    country = params[:country]

    facade = RecipeFacade.find_recipes(country)
    render json: RecipesSerializer.new(facade)
  end

end