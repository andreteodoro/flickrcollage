require 'rmagick'
#include Magick

module FlickrCollage
  class App

    def self.begin(keywords, filename)
      #dictionary = FlickrService::Dictionary.new
      flickr_api = FlickrService::FlickrApi.new
      download = FlickrService::Download
      crop = FlickrService::Crop
      crops =  Magick::ImageList.new
      collage = FlickrService::Collage.new

      urls = keywords.take(10).map do |keyword|
        flickr_api.query_by_keyword(keyword)
      end.compact

      # TODO: Implement dictionary first
      #while urls.length != 10
        #keyword = dictionary.class.read
        #url = flickr_api.query_by_keyword(keyword)
        #urls.push(url) unless url.nil?
      #end

      photos = urls.map{|url| download.download(url)}

      crops << crop.crop(photos)

      collage.mount(photos)
      #collage.write("#{filename}.jpg")

      true
    end

  end
end
