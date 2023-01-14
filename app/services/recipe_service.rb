class RecipeService
  
  def self.get_recipes(country)
    response = base_url.get("api/recipes/v2?") do |f|
      f.params["type"] = "any"
      f.params["q"] = "#{country}"
    end
   JSON.parse(response.body, symbolize_names: true)
  end

  def self.base_url
    Faraday.new(url: "https://api.edamam.com/") do |f| 
      f.params["app_id"] = ENV["edamam_id"]
      f.params["app_key"] = ENV["edamam_app_key"]
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end