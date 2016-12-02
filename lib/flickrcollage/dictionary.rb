require 'rmagick'

class Dictionary

    def self.read
      File.readlines('/usr/share/dict/words').sample.strip
    rescue IOException => e
      puts "Error getting images from dictionary: #{e.message}"
    end

end
