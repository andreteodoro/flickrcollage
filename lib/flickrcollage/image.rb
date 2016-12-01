require 'rmagick'

class Image

  class FileWriteError < StandardError; end

  def self.save(image, filename)
    # force jpg if not defined
    filename = "#{filename}.jpg" unless filename.end_with? '.jpg'

    begin
      image.write(filename)
    rescue => e
      raise FileWriteError, "Error while trying to save the collage: #{e.message}"
    end
  end

end
