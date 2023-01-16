class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country].present? == true 
      facade = RecipeFacade.find_recipes(params[:country])
      if facade == nil
        render json: {:data => []}
      else
        render json: RecipesSerializer.new(facade)
      end
    else
      random_recipes = []
      until random_recipes.count > 0 do
        random_country = CountryFacade.random_country.shuffle.first
        random_recipes = RecipeFacade.find_recipes(random_country.name)
      end
      render json: RecipesSerializer.new(random_recipes)
    end
  end
end
