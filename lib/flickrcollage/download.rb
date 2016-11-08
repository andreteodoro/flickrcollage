require 'open-uri'
require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

module FlickrService
  class Download

    # Donwload the photos into a temp folder
    # The tempfile object is deleted automatically after used
    def self.download(url = nil)
      return nil unless url
      begin
        tmp_file = Tempfile.new 'flickr-photo'
        download = open(url)
        IO.copy_stream(download, tmp_file)

        tmp_file
      rescue => e
        raise IOError, "Error while trying to download the photo: #{e.message}"
      ensure
        tmp_file.close
        tmp_file.unlink
      end
    end

  end
end