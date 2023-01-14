class Recipe
  attr_reader :title,
              :url,
              :country,
              :image
  def initialize(hash, country)
    @title = hash[:recipe][:label]
    @url = hash[:recipe][:url]
    @country = country
    @image = hash[:recipe][:image]
  end
end