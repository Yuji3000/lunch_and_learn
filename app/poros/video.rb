class Video
  attr_reader :title,
              :youtube_video_id
  def initialize(items)
    # require 'pry'; binding.pry
    @title = items[0][:snippet][:title]
    @youtube_video_id = items[0][:id][:videoId]
  end
end