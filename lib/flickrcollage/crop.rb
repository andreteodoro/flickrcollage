require 'rmagick'
require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

module FlickrService
  class Crop

    # Crop all images in 640x480 rectangles
    # param urls the image urls
    def self.crop_all(urls)
      images = Magick::ImageList.new

      urls.each do |url|
        image = Magick::Image.from_blob(open(url).read).first
        image.crop!(0,0,640,480)
        images << image
      end

      images
    end

  end
end