require 'rmagick'

module FlickrService
  class Dictionary

    def self.read
      File.readlines("/usr/share/dict/words").sample.strip
    rescue Exception => e
      raise IOError, "Error getting images from dictionary: #{e.message}"
    end

  end
end