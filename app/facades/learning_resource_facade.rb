class LearningResourceFacade
  def self.video(country)
    results = YoutubeService.get_video(country)
    # require 'pry'; binding.pry
    video_data = {
      title: results[:items][0][:snippet][:title],
      youtube_video_id: results[:items][0][:id][:videoId]
    }
  end

  def self.pictures(country)
    # require 'pry'; binding.pry
    results = PicService.find_pics(country)
# require 'pry'; binding.pry
    results[:results].map do |pic|
      # require 'pry'; binding.pry
      {
        alt_tag: pic[:alt_description],
        url: pic[:urls][:raw]
      }
    end
  end

  def self.new_resource(country)
    video = video(country)
    pics = pictures(country)
    if video == nil
      video = []
    elsif pics == nil
      pics = []
    end
    LearningResource.new(country, video, pics)
  end
end