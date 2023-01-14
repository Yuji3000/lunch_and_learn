require 'rails_helper'

RSpec.describe Recipe do
  it 'has attributes' do
    country = "Thailand"
    response_body = RecipeService.get_recipes(country)

    first_recipe = response_body[:hits][0]

    recipe = Recipe.new(first_recipe, country)
   
    expect(recipe.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
    expect(recipe.url).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
    expect(recipe.country).to eq(country)
    expect(recipe.image).to eq(first_recipe[:recipe][:image])
  end
end