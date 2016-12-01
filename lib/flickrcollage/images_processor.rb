require 'rmagick'
require 'open-uri'
require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class ImagesProcessor

  class ImageMagickError < StandardError; end

  WIDTH = 640
  HEIGHT = 480
  COLLAGE_MARGINS = 1
  COLLAGE_GRID = '4x3'
  BACKGROUND_COLOR = '#000000'

  def initialize
    @image_list = Magick::ImageList.new
  end

  def crop(urls)
    begin
      urls.each do |url|
        image = Magick::Image.from_blob(open(url).read).first
        image.crop!(0,0,WIDTH,HEIGHT)
        @image_list << image
      end
    rescue => e
      raise ImageMagickError, "Error while cropping images: #{e.message}"
    end
    @image_list
  end

  # Use rmagick to assembles a collage grid from ten image urls
  def collage(image_list)
    begin
      image_list.montage {
        self.geometry = "#{WIDTH}x#{HEIGHT}+#{COLLAGE_MARGINS}+#{COLLAGE_MARGINS}"
        self.tile = COLLAGE_GRID
        self.background_color = BACKGROUND_COLOR
      }
    rescue => e
      raise ImageMagickError, "Error while creating a collage: #{e.message}"
    end
  end

end
