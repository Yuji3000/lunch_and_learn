# require 'rails_helper'

# RSpec.describe Video do
#   it 'has attributes' do
#     VCR.use_cassette('video_poros') do
#       country = 'laos'
#       video = YoutubeService.get_video(country)
#       items = video[:items][0]
    
#       video_obj = Video.new(items)
#       expect(video_obj.title).to be_a(String)
#       expect(video_obj.title).to eq("A Super Quick History of Laos")
#       expect(video_obj.youtube_video_id).to be_a(String)
#       expect(video_obj.youtube_video_id).to eq("uw8hjVqxMXw")
#     end
#   end
# end