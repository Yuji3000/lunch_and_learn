require 'rails_helper'

RSpec.describe LearningResource do
  it "has attributes" do
    VCR.use_cassette('learn_resource_thailand') do
      country = "laos"

      video_data = {
        :title=>"Meow Meow Beans",
        :youtube_video_id=>"2323232323232"
      }
      pic_data = [{
        :alt_tag=>"meowmeow",
        :url=>"www.meowmeow.com"
      }]
      resource = LearningResource.new(country, video_data, pic_data)

      expect(resource.country).to eq(country)
      expect(resource.id).to eq(nil)
      expect(resource.images).to eq(pic_data)
      expect(resource.video).to eq(video_data)
      expect(resource.type).to eq("learning_resource")
    end
  end
end