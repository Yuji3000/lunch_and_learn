require 'rails_helper'

RSpec.describe Pictures do
  it 'has attributes' do
    country = 'laos'
    pics = PicService.find_pics(country)
    pictures = pics[:photos][:photo].first

    pic_array = Pictures.new(pictures)

    expect(pic_array.alt_tag).to be_a(String)
    expect(pic_array.alt_tag).to eq("2244 - Laos Kambodscha 2022")
    expect(pic_array.url).to be_a(String)
    expect(pic_array.url.include?("https://live.staticflickr.com")).to eq(true)
    expect(pic_array.url).to eq("https://live.staticflickr.com/65535/52627642078_b48f226d53.jpg")
  end
end