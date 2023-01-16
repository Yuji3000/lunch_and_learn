# class Pictures
#   attr_reader :alt_tag,
#               :url
#   def initialize(photo_array)
#     @alt_tag = photo_array[:title]
#     # require 'pry'; binding.pry
#     @url = get_url(photo_array)
#   end

#   def get_url(photo_array)
#     id = photo_array[:id]
#     server_id = photo_array[:server]
#     secret = photo_array[:secret]

#     return "https://live.staticflickr.com/#{server_id}/#{id}_#{secret}.jpg"
#   end
# end

  