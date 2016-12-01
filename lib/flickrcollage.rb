require "flickrcollage/dictionary"
require "flickrcollage/flickr_api"
require "flickrcollage/image"
require "flickrcollage/images_processor"
require 'rmagick'

module FlickrCollage
  class App

    def self.begin(keywords, filename)
      flickr = FlickrApi.new
      image_processor = ImagesProcessor.new

      # Search by the keywords using the Flickr Api
      urls = keywords.take(12).map do |keyword|
        flickr.query_by_keyword(keyword)
      end.compact

      # Get from dictionary if there are less than twelve keywords
      while urls.length != 12
        keyword = Dictionary.read
        url = flickr.query_by_keyword(keyword)
        urls.push(url) unless url.nil?
      end

      # Crop the images in rectangles 200x200
      cropped_images = image_processor.crop(urls)

      # Mount a grid collage with the images
      collage = image_processor.collage(cropped_images)

      # Save the file
      Image.save(collage, filename)

      true
    end

  end
end
