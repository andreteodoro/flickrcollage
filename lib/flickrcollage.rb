#require './lib/flickrcollage/dictionary'
require './lib/flickrcollage/flickr_service'
require './lib/flickrcollage/crop'
require './lib/flickrcollage/download'
require './lib/flickrcollage/collage'
require 'rmagick'
include Magick

module FlickrCollage
  class FlickrCollage

    def self.begin(keywords, filename)
      #dictionary = Dictionary.new
      flickr_service = FlickrService.new
      download = Download.new
      crop = Crop.new
      crops =  Magick::ImageList.new
      collage = Collage.new

      urls = keywords.take(10).map do |keyword|
        flickr_service.class.query_by_keyword(keyword)
      end.compact

      while urls.length != 10
        #keyword = dictionary.class.read
        url = flickr_service.class.query_by_keyword(keyword)
        urls.push(url) unless url.nil?
      end

      photos = urls.map{|url| download.class.download(url)}

      crops << crop.class.crop(photos)

      collage.class.mount({photos: photos, output: filename})
      #collage.write("#{filename}.jpg")

      true
    end

  end
end
