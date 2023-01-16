class PicService
  def self.find_pics(country)
    conn = Faraday.new(url: "https://api.unsplash.com") do |f|
      f.params["client_id"] = ENV["unsplash_access_key"]
    end
    
    response = conn.get("/search/photos?") do |f|
      f.params["query"] = "#{country}"
      f.headers["Accept-Version"] = "v1"
   
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end

