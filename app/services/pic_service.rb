class PicService
  def self.find_pics(country)
    conn = Faraday.new(url: "https://api.flickr.com") do |f|
      f.params["api_key"] = ENV["flickr_api_key"]
    end
    
    response = conn.get("/services/rest/?") do |f|
      f.params["method"] = "flickr.photos.search"
      f.params["content_type"] = "1"
      f.params["text"] = "#{country}"
      f.params["format"] = "json"
      f.params["nojsoncallback"] = "?"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end

#image link below
# https://live.staticflickr.com/{server-id}/{id}_{secret}.jpg