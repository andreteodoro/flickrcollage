require 'rmagick'

module FlickrService
  class Collage

    # Use rmagick to assembles a collage grid from ten images
    def self.mount(images)
      width = 200
      height = 200
      margins = 10
      grid = "5x2"
      #bg_color = "#000000"

      images.montage {
        self.geometry = "#{width}x#{height}+#{margins}+#{margins}"
        self.tile = grid
        #self.background_color = bg_color
      }
    end

  end
end