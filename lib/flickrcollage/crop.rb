require 'rmagick'

module FlickrService
  class Crop

    # Crop all images in 200x200 rectangles
    # param urls the image urls
    def self.crop_all(urls)
      images = Magick::ImageList.new

      urls.each do |url|
        image = Magick::Image.from_blob(open(url).read).first
        image.crop!(0,0,200,200)
        images << image
      end

      images
    end

  end
end