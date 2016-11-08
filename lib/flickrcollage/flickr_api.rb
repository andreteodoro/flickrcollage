require 'flickraw'

module FlickrService
 class FlickrApi

   def initialize
     # try to get the environment variables for the Flickr API Keys, if not existent use mine
     FlickRaw.api_key = ENV['FLICKR_API_KEY'] || "796cb009c4299d87049aaf1d12a47a9e"
     FlickRaw.shared_secret = ENV['FLICKR_API_SECRET'] || "f6200bb48e6ac749"

     @flickr = FlickRaw::Flickr.new
   end

   def query_by_keyword(keyword = nil)
     return nil unless keyword

     options = {text: keyword, media: :photos, per_page: 1, page: 1, content_type: 1, sort: 'interestingness-desc' }
     photo = @flickr.photos.search(options).first

     unless photo.nil?
       info = @flickr.photos.getInfo(photo_id: photo.id, secret: photo.secret)
       FlickRaw.url_c(info)
     end
   rescue Exception => e
     raise "Error searching image from flickr: #{e.message}"
   end

 end
end