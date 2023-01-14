class Api::V1::RecipesController < ApplicationController
  
  def index
    # conn = Faraday.new(url: "https://api.edamam.com/") do |f| 
    #   f.params["app_id"] = ENV["edamam_id"]
    #   f.params["app_key"] = ENV["edamam_app_key"]
      
    # end
    
    # response = conn.get("api/recipes/v2?") do |f|
    #   f.params["type"] = "any"
    #   f.params["q"] = "thailand"
    # end

    # a = JSON.parse(response.body, symbolize_names: true)
    RecipeService.get_recipes("thailand")
  end

end