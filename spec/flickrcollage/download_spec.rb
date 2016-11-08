require 'spec_helper'

describe FlickrService::Download do

  let(:flickr_api) { FlickrService::FlickrApi.new }
  let(:download) { FlickrService::Download }
  let(:keyword) { 'Etventure' }
  let(:url) { flickr_api.query_by_keyword(keyword) }

  describe '.download' do
    it 'fails downloading a photo' do
      expect(download.download).to be_nil
    end

    it 'download a photo' do
      expect(download.download(url)).to_not be_nil
    end

  end
end