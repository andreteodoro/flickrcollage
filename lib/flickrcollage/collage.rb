require 'rmagick'

module FlickrService
  class Collage

    # Use rmagick to assembles a collage grid from ten image urls
    def self.mount(images)
      width = 640
      height = 480
      margins = 1
      grid = "5x2"

      images.montage {
        self.geometry = "#{width}x#{height}+#{margins}+#{margins}"
        self.tile = grid
      }
    end

    def self.write(collage, filename)
      # force jpg if not defined
      filename = "#{filename}.jpg" unless filename.end_with? '.jpg'

      begin
        collage.write(filename)
      rescue => e
        raise IOError, "Error while trying to save the collage: #{e.message}"
      end

    end

  end
end