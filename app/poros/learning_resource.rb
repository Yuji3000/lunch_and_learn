class LearningResource
  attr_reader :id,
              :type,
              :country,
              :video,
              :images
  def initialize(country, video_data, pic_data)
    @id = nil
    @type = "learning_resource"
    @country = country
    @video = video_data
    @images = pic_data
  end
end