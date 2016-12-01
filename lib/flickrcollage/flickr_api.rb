require 'flickraw'
require 'yaml'

 class FlickrApi

   def initialize
     # try to get the environment variables for the Flickr API Keys, if not existent use the existent at the credentials.yml file
     config = YAML.load_file('./config/credentials.yml')

     FlickRaw.api_key = ENV['FLICKR_API_KEY'] || config['api_key']
     FlickRaw.shared_secret = ENV['FLICKR_API_SECRET'] || config['shared_secret']

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
   rescue => e
     raise "Error searching image from flickr: #{e.message}"
   end

 end
