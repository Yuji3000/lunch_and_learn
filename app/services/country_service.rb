class CountryService
  def self.random_country
    conn = Faraday.new(url: "https://restcountries.com")

    response = conn.get("/v3.1/all") 
    # require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
  end
end