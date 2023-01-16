class CountryFacade
  def self.random_country
    response = CountryService.random_country
    response.map do |info|
      Country.new(info[:name])
    end
  end
end