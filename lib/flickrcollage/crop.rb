require 'rmagick'

module FlickrService
  class Crop

    # Crop an image in 200x200 rectangles
    def self.crop(url)
      magick =  Magick::ImageList.new
      image = open(url)

      magick.from_blob(image.read)
      magick.crop(0,0,200,200)
    end

  end
end