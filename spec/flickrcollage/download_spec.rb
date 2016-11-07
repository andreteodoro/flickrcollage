require 'spec_helper'

describe FlickrService::Download do

  let(:service) { FlickrService::FlickrApi.new }
  let(:keyword) { 'Etventure' }
  let(:url) { service.query_by_keyword(keyword) }

  describe 'Test download and delete features' do
    it 'fails downloading a photo' do
      expect(FlickrService::Download.download).to be_nil
    end

    it 'downloads a photo' do
      expect(FlickrService::Download.download(url)).to_not be_nil
    end

  end
end