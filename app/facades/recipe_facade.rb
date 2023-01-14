class RecipeFacade
  def self.find_recipes(country)
    results = RecipeService.get_recipes(country)
    a = results[:hits].map do |recipe|
      Recipe.new(recipe, country)
    end
  end
end