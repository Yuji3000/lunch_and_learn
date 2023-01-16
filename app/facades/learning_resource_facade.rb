class LearningResourceFacade
  def self.video(country)
    results = YoutubeService.get_video(country)
    # require 'pry'; binding.pry
    if results[:items].empty? == false
      video_data = {
        title: results[:items][0][:snippet][:title],
        youtube_video_id: results[:items][0][:id][:videoId]
      }
    end
  end

  def self.pictures(country)
    results = PicService.find_pics(country)
    results[:results].map do |pic|
      {
        alt_tag: pic[:alt_description],
        url: pic[:urls][:raw]
      }
    end
  end

  def self.new_resource(country)
    video = video(country)
    # require 'pry'; binding.pry
    pics = pictures(country)
    # require 'pry'; binding.pry
    if video == nil
      video = {}
    # elsif pics == nil
    #   pics = []
    end
    LearningResource.new(country, video, pics)
  end
end