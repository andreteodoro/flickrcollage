require "flickrcollage/dictionary"
require "flickrcollage/flickr_api"
require "flickrcollage/crop"
require "flickrcollage/collage"
require 'rmagick'

module FlickrCollage
  class App

    def self.begin(keywords, filename)
      dictionary = FlickrService::Dictionary
      flickr_api = FlickrService::FlickrApi.new
      collage_service = FlickrService::Collage
      crop_service = FlickrService::Crop

      # Search bythe keywords using the Flickr Api
      urls = keywords.take(10).map do |keyword|
        flickr_api.query_by_keyword(keyword)
      end.compact

      # Get from dictionary if there are less than ten keywords
      while urls.length != 10
        keyword = dictionary.read
        url = flickr_api.query_by_keyword(keyword)
        urls.push(url) unless url.nil?
      end

      # Crop the images in rectangles 200x200
      images = crop_service.crop_all(urls)

      # Mount a grid collage with the images
      images = collage_service.mount(images)

      # Save the file
      collage_service.write(images, filename)

      true
    end

  end
end
