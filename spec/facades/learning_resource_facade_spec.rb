require 'rails_helper'

RSpec.describe LearningResourceFacade do
  it '.video' do
    VCR.use_cassette('resource.video') do

      country = "laos"

      video_resource = LearningResourceFacade.video(country)
      # require 'pry'; binding.pry
      expect(video_resource).to be_a(Hash)
    end
  end

  it '.pictures' do
    VCR.use_cassette('resource.pictures') do
      country = "laos"

      pic_resource = LearningResourceFacade.pictures(country)
      # require 'pry'; binding.pry
      expect(pic_resource).to be_a(Array)
    end
  end

  it '.new_resource' do
    VCR.use_cassette('learn_resource_thailand') do
      country = "laos"

      new_resource = LearningResourceFacade.new_resource(country)
      expect(new_resource).to be_a(LearningResource)
    end
  end
end