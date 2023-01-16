class YoutubeService
  def self.get_video(country)
    conn = Faraday.new(url: "https://www.googleapis.com/") do |f| 
      f.params["key"] = ENV["youtube_api_key"]
    end

    response = conn.get("youtube/v3/search?") do |f| 
      f.params["channelId"] = "UCluQ5yInbeAkkeCndNnUhpw"
      f.params["type"] = "video"
      f.params["q"] = "#{country}"
      f.params["part"] = "snippet"
      f.params["maxResults"] = "1"
    end
    
    JSON.parse(response.body, symbolize_names: true)
  end

end