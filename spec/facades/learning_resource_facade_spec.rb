require 'rails_helper'

RSpec.describe LearningResourceFacade do
  it '.video' do

    country = "laos"

    video_resource = LearningResourceFacade.video(country)
    require 'pry'; binding.pry
    expect(video_resource).to be_a(Hash)
    # json = resources.to_json
  end

  it '.pictures' do
    country = "laos"

    pic_resource = LearningResourceFacade.pictures(country)
    require 'pry'; binding.pry
    expect(pic_resource).to be_a(Array)
  end

  it '.new_resource' do
    VCR.use_cassette('learn_resource_thailand') do
      country = "laos"

      new_resource = LearningResourceFacade.new_resource(country)
      expect(new_resource).to be_a(LearningResource)
    end
  end
end